import 'package:dio/dio.dart';

import '../../lib.dart';

class CustomInterceptors extends Interceptor {
  const CustomInterceptors();
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isDownload =
        options.method == 'GET' && options.responseType == ResponseType.stream;

    // Skip if it's a download request
    if (isDownload) {
      return handler.next(options); // Pass through without modification
    }

    options.headers["X-API-KEY"] = Env.apiKey;

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}
