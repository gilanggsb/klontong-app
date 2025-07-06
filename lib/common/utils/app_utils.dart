import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../common.dart';

class AppUtils {
  // to disable all skeleton
  static bool isSkeletonEnabled = false || !kDebugMode;

  static bool isWebUrl(String imageUrl) {
    final uri = Uri.tryParse(imageUrl);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  static bool isLocalFile(String imageUrl) {
    final uri = Uri.tryParse(imageUrl);
    return uri != null && uri.scheme == 'file';
  }

  static const Map<String, String> contentTypeToFileExtension = {
    'image/jpeg': '.jpg',
    'image/png': '.png',
    'image/gif': '.gif',
    'image/webp': '.webp',
    'image/bmp': '.bmp',
    'image/svg+xml': '.svg',
    'image/tiff': '.tiff',
    'application/pdf': '.pdf',
    'application/x-pdf': '.pdf',
    'application/msword': '.doc',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
        '.docx',
    'application/vnd.ms-excel': '.xls',
    'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
        '.xlsx',
    'application/vnd.ms-powerpoint': '.ppt',
    'application/vnd.openxmlformats-officedocument.presentationml.presentation':
        '.pptx',
    'text/plain': '.txt',
    'application/rtf': '.rtf',
    'application/vnd.oasis.opendocument.text': '.odt',
  };

  static Future<void> handleBlocState<T>({
    required FutureOr<dynamic> Function() action, // Future action to execute
    required void Function(T) emit, // Emit function for states
    required BlocBase?
    bloc, // Optional Bloc/Cubit reference to check if it's closed
    T? Function()? loadingState, // Nullable loading state
    T? Function(dynamic)? successState, // Nullable success state
    T? Function(String? message, {dynamic data})?
    failureState, // Nullable failure state
  }) async {
    // Wrap the emit function to check if the Cubit/Bloc is closed
    void safeEmit(T state) {
      if (bloc != null && !bloc.isClosed) {
        emit(state);
      }
    }

    try {
      // Emit loading state if provided
      if (loadingState != null) {
        safeEmit(loadingState() as T);
      }

      // Execute the action (e.g., API call or async operation)
      final data = await action();

      // Emit success state if provided
      if (successState != null) {
        safeEmit(successState(data) as T);
      }
    } on BadResponseFailure catch (e) {
      if (failureState == null) return;
      safeEmit(failureState.call(e.message, data: e) as T);
    } on ServerFailure catch (e) {
      if (failureState == null) return;
      safeEmit(failureState.call(e.message, data: e) as T);
    } on String catch (e) {
      // Handle errors where the exception is a string
      if (failureState == null) return;
      safeEmit(failureState.call(e) as T);
    } catch (e) {
      // Handle other general exceptions
      if (failureState == null) return;
      safeEmit(failureState.call(e.toString()) as T);
    }
  }

  static Future<DateTimeRange?> dateRangePicker(
    BuildContext context, {
    DateTimeRange? dateRange,
  }) async {
    return await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      helpText: 'Select a Date or Date-Range',
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDateRange:
          dateRange ??
          DateTimeRange(start: DateTime.now(), end: DateTime.now()),
    );
  }

  static Future<DateTime?> datePicker(
    BuildContext context, {
    DateTime? initialDate,
  }) async {
    return await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      helpText: 'Select a Date or Date-Range',
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: initialDate,
    );
  }

  static String getFilenameFromURI(String stringUrl) {
    final url = Uri.parse(stringUrl);
    final lastPathName = url.pathSegments.last;
    if (lastPathName.contains('.')) {
      lastPathName.split('.').first;
    }
    return lastPathName;
  }

  /// Encrypt a string using AES-like logic (simple XOR-based for demonstration)
  static String encrypt(String text, String saltKey) {
    final textBytes = utf8.encode(text);
    final keyBytes = utf8.encode(saltKey);

    // Perform XOR encryption
    final encryptedBytes = Uint8List(textBytes.length);
    for (int i = 0; i < textBytes.length; i++) {
      encryptedBytes[i] = textBytes[i] ^ keyBytes[i % keyBytes.length];
    }

    // Return as Base64 encoded string
    return base64Encode(encryptedBytes);
  }

  /// Decrypt a string using the same logic as encryption
  static String decrypt(String encryptedText, String saltKey) {
    final encryptedBytes = base64Decode(encryptedText);
    final keyBytes = utf8.encode(saltKey);

    // Perform XOR decryption (same logic as encryption)
    final decryptedBytes = Uint8List(encryptedBytes.length);
    for (int i = 0; i < encryptedBytes.length; i++) {
      decryptedBytes[i] = encryptedBytes[i] ^ keyBytes[i % keyBytes.length];
    }

    // Convert back to string
    return utf8.decode(decryptedBytes);
  }

  static bool isBoolOrNull(dynamic data) {
    if (data is bool) {
      return true;
    }

    if (data == null) {
      return true;
    }
    return false;
  }

  static Future<DeviceSystemInfo> getDeviceSystemInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    DeviceSystemInfo appInfo = DeviceSystemInfo(
      appVersion: packageInfo.version,
      appName: packageInfo.appName,
      devicePlatform: Platform.operatingSystem,
    );
    if (Platform.isAndroid) {
      var androidInfo = await DeviceInfoPlugin().androidInfo;
      var release = androidInfo.version.release;
      var sdkInt = androidInfo.version.sdkInt;
      var manufacturer = androidInfo.manufacturer;
      var model = androidInfo.model;
      // print('Android $release (SDK $sdkInt), $manufacturer $model');
      // Android 9 (SDK 28), Xiaomi Redmi Note 7
      appInfo = appInfo.copyWith(
        osVersion: "Android $release (SDK $sdkInt)",
        deviceModel: "$manufacturer $model",
      );
    }

    if (Platform.isIOS) {
      var iosInfo = await DeviceInfoPlugin().iosInfo;
      var systemName = iosInfo.systemName;
      var version = iosInfo.systemVersion;
      var name = iosInfo.name;
      var model = iosInfo.model;
      // print('$systemName $version, $name $model');
      // iOS 13.1, iPhone 11 Pro Max iPhone
      appInfo = appInfo.copyWith(
        osVersion: "$systemName $version",
        deviceModel: "$name $model",
      );
    }

    return appInfo;
  }
}

const customFreezed = Freezed(
  fromJson: true,
  toJson: true,
  unionValueCase: FreezedUnionCase.snake,
);
const customJsonSerializable = JsonSerializable(fieldRename: FieldRename.snake);
