import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../common.dart';

abstract class NetworkingUtils {
  static String applyPathParams(String url, Map<String, dynamic>? pathParams) {
    if (pathParams == null) return url;

    pathParams.forEach((key, value) {
      if (value != null) {
        url = "$url/$value";
      }
    });
    return url;
  }

  static Future<FormData> createFormData(Map<String, dynamic> params) async {
    final Map<String, dynamic> formDataMap = {};

    Future<dynamic> processEntry(String key, dynamic entry) async {
      if (entry is File) {
        // Handle File objects and convert to MultipartFile
        return convertFileToMultipartFile(entry);
      } else if (entry is List<MultipartFile>) {
        // Recursively handle lists
        return Future.wait(
          entry.map((item) => processEntry(key, item)).toList(),
        );
      } else if (entry is List<Map<String, dynamic>>) {
        return entry.map((e) => jsonEncode(e)).toList().toString();
      } else if (entry is Map) {
        // Recursively handle nested maps
        final map = <String, dynamic>{};
        for (var subEntry in entry.entries) {
          map[subEntry.key] = await processEntry(key, subEntry.value);
        }
        return map;
      } else if (entry is List) {
        return entry.map((e) => e).toList().toString();
      } else {
        // Handle primitive types (String, int, etc.)
        return entry;
      }
    }

    for (var entry in params.entries) {
      formDataMap[entry.key] = await processEntry(entry.key, entry.value);
      // Logger.logInfo("CEK ENTRY ${formDataMap[entry.key]}");
    }

    return FormData.fromMap(formDataMap, ListFormat.multiCompatible);
  }

  static Future<MultipartFile> convertFileToMultipartFile(File file) async {
    return await MultipartFile.fromFile(
      file.path,
      filename: file.path.split('/').last,
    );
  }

  static Future<List<MultipartFile>> convertFilesToMultipartFile(
    List<File> files,
  ) async {
    final filteredList =
        files.where((e) => !AppUtils.isWebUrl(e.path)).toList();
    return await Future.wait(
      filteredList.map((e) => convertFileToMultipartFile(e)),
    );
  }

  static BaseResponse<T> parseResponse<T>(
    Response response,
    FromJsonT<T> fromJsonT,
  ) {
    try {
      final BaseResponse<T> baseResponse = BaseResponse.fromJson(
        response.data ?? {},
        fromJsonT,
      );
      return baseResponse;
    } catch (e) {
      rethrow;
    }
  }
  // ---

  /// Parses a DioException and throws a specific Failure type.
  static Never parseError(DioException e) {
    switch (e.type) {
      case DioExceptionType.badResponse:
        // Delegate to a dedicated function for handling bad responses
        throw _handleBadResponse(e);

      case DioExceptionType.connectionTimeout:
        throw ServerFailure(
          'Connection timed out. Please check your internet connection and try again.',
        );

      case DioExceptionType.receiveTimeout:
        throw ServerFailure(
          'Failed to receive a response from the server in time. Please try again later.',
        );

      case DioExceptionType.sendTimeout:
        throw ServerFailure(
          'Failed to send request to the server in time. Please check your connection and try again.',
        );

      case DioExceptionType.connectionError:
        // Use a more specific network failure for connection issues
        throw ServerFailure(
          e.message ?? 'Connection error occurred. Please try again.',
        );

      case DioExceptionType.cancel:
        throw ServerFailure('Request to the server was cancelled.');

      case DioExceptionType.unknown:
        // Check for SocketException specifically for network connectivity issues
        if (e.error is FormatException) {
          throw ServerFailure('Invalid response format from server.');
        } else if (e.message?.contains('SocketException') ?? false) {
          throw ServerFailure(
            'No internet connection. Please check your network settings.',
          );
        }
        // Fallback for other unknown errors
        throw ServerFailure(
          e.message ??
              e.error?.toString() ??
              'An unexpected error occurred. Please try again.',
        );

      default:
        // Catch any unhandled DioException types
        throw ServerFailure('An unexpected error occurred. Please try again.');
    }
  }

  /// Handles and parses DioExceptionType.badResponse specifically.
  /// Throws a BadResponseFailure or ServerFailure based on the response.
  static Never _handleBadResponse(DioException e) {
    final statusCode = e.response?.statusCode;
    final dynamic responseData = e.response?.data;

    Logger.error(
      "Bad Response - Status: $statusCode, Data: $responseData, Error: ${e.error}",
    );

    if (responseData == null) {
      throw ServerFailure(
        'Server responded with an error but no data was received.',
      );
    }

    switch (statusCode) {
      case 522:
        throw ServerFailure(
          'Connection timed out on the server side. Please try again.',
        );
      case 502:
        throw ServerFailure(
          'Bad Gateway. The server received an invalid response.',
        );
      case 404:
        throw BadResponseFailure('Resource not found.', statusCode: statusCode);
      case 401:
        throw BadResponseFailure(
          'Unauthorized access. Please log in again.',
          statusCode: statusCode,
        );
      case 403:
        throw BadResponseFailure(
          'Forbidden access. You do not have permission.',
          statusCode: statusCode,
        );
      case 400:
        // Attempt to parse validation errors or bad request details
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('message')) {
          throw BadResponseFailure(
            responseData['message'] as String,
            statusCode: statusCode,
          );
        }
        throw BadResponseFailure(
          'Bad request. Please check your input.',
          statusCode: statusCode,
        );
      default:
        // Handle generic bad responses or unhandled status codes
        if (responseData is String) {
          // If response data is a plain string, use it as the message
          throw BadResponseFailure(responseData, statusCode: statusCode);
        } else if (responseData is Map<String, dynamic> &&
            responseData.containsKey('error')) {
          // If response data is a map with an 'error' key
          throw BadResponseFailure(
            responseData['error'].toString(),
            statusCode: statusCode,
          );
        } else {
          // Generic message for other unparsable bad responses
          throw ServerFailure(
            'Server error with status code $statusCode. Please try again.',
          );
        }
    }
  }
}
