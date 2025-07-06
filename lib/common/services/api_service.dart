import 'package:dio/dio.dart';
import 'package:requests_inspector/requests_inspector.dart';

import '../common.dart';

class ApiService {
  final Dio dio;
  final bool isTesting;

  ApiService({required this.dio, this.isTesting = false}) {
    _initializeDio();
  }

  void _initializeDio() {
    dio
      ..options = BaseOptions(
        baseUrl: URL.base,
        connectTimeout: const Duration(minutes: 1),
        headers: {
          "Connection": "Keep-Alive",
          "Keep-Alive": "timeout=5, max=1000",
          ...dio.options.headers,
        },
      )
      ..interceptors.addAll(_buildInterceptors());
  }

  List<Interceptor> _buildInterceptors() {
    return [const CustomInterceptors(), RequestsInspectorInterceptor()];
  }

  Dio _createDioInstance({bool addLogger = false}) {
    final dioInstance = Dio(dio.options)..interceptors.addAll(dio.interceptors);

    dioInstance.options.extra = {...dioInstance.options.extra};

    if (addLogger) {
      dioInstance.interceptors.add(
        CurlLoggerDioInterceptor(printOnSuccess: true),
      );
      if (!isTesting) {
        dioInstance.interceptors.add(
          PrettyDioLogger(requestHeader: true, requestBody: true),
        );
      }
    }

    return dioInstance;
  }

  Future<BaseResponse<T>> _performRequest<T>(
    Future<Response> Function() request,
    FromJsonT<T> fromJsonT,
  ) async {
    try {
      final response = await request();
      return BaseResponse.fromJson(response.data ?? {}, fromJsonT);
    } on DioException catch (e) {
      return NetworkingUtils.parseError(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<BaseResponse<T>> _request<T>({
    required Future<Response> Function(Dio dioInstance) method,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    bool addLogger = false,
  }) {
    final dioInstance = _createDioInstance(addLogger: addLogger);
    return _performRequest(() => method(dioInstance), fromJsonT);
  }

  Future<String> setBaseUrl(String newUrl) async {
    dio.options = dio.options.copyWith(baseUrl: newUrl);
    return newUrl;
  }

  Future<BaseResponse<T>> post<T>(
    String path, {
    required Map<String, dynamic> body,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Options? options,
    bool addLogger = false,
  }) {
    final finalPath = NetworkingUtils.applyPathParams(path, pathParams);
    return _request(
      method: (dio) => dio.post(finalPath, data: body, options: options),
      fromJsonT: fromJsonT,
      pathParams: pathParams,
      addLogger: addLogger,
    );
  }

  Future<BaseResponse<T>> get<T>(
    String path, {
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
    Options? options,
    bool addLogger = false,
  }) {
    final finalPath = NetworkingUtils.applyPathParams(path, pathParams);
    return _request(
      method:
          (dio) => dio.get(
            finalPath,
            queryParameters: queryParams,
            options: options,
          ),
      fromJsonT: fromJsonT,
      pathParams: pathParams,
      addLogger: addLogger,
    );
  }

  Future<BaseResponse<T>> delete<T>(
    String path, {
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Map<String, dynamic>? queryParams,
    Options? options,
    bool addLogger = false,
  }) {
    final finalPath = NetworkingUtils.applyPathParams(path, pathParams);
    return _request(
      method:
          (dio) => dio.delete(
            finalPath,
            queryParameters: queryParams,
            options: options,
          ),
      fromJsonT: fromJsonT,
      pathParams: pathParams,
      addLogger: addLogger,
    );
  }

  Future<BaseResponse<T>> put<T>(
    String path, {
    required Map<String, dynamic> body,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Options? options,
    bool addLogger = false,
  }) {
    final finalPath = NetworkingUtils.applyPathParams(path, pathParams);
    return _request(
      method: (dio) => dio.put(finalPath, data: body, options: options),
      fromJsonT: fromJsonT,
      pathParams: pathParams,
      addLogger: addLogger,
    );
  }

  Future<BaseResponse<T>> uploadFormData<T>(
    String path, {
    required FormData formData,
    required FromJsonT<T> fromJsonT,
    Map<String, dynamic>? pathParams,
    Options? options,
    bool addLogger = false,
  }) {
    final finalPath = NetworkingUtils.applyPathParams(path, pathParams);
    return _request(
      method:
          (dio) => dio.post(
            finalPath,
            options: options?.copyWith(contentType: 'multipart/form-data'),
            data: formData,
          ),
      fromJsonT: fromJsonT,
      pathParams: pathParams,
      addLogger: addLogger,
    );
  }

  Future<String?> getFileExtensionFromUrl(String url) async {
    try {
      // final response = await Dio().head(url);
      final response = await _createDioInstance().get(url);
      final contentType = response.headers.value('content-type');

      return AppUtils.contentTypeToFileExtension[contentType];
    } catch (e) {
      Logger.error("ERROR getFileExtensionFromUrl : ${e.toString()}");
      return null;
    }
  }
}
