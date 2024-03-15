import 'package:dio/dio.dart';
import 'package:front_end_mobile_20240117/flavor/flavor_config.dart';

abstract class BaseApiClient {
  Dio getDio({
    int? timeOut,
    String? contentType,
  }) {
    var dio = Dio();

    // API end point
    dio.options.baseUrl = AppConfig.shared.baseUrl;

    // Set time out
    dio.options.connectTimeout = Duration(seconds: timeOut ?? 20000);
    dio.options.receiveTimeout = Duration(seconds: timeOut ?? 20000);
    dio.options.contentType = contentType ?? 'application/json';

    dio.interceptors.addAll([
      // Log
      LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
      ),

      InterceptorsWrapper(onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) {
        options.headers = getHeaders();
        return handler.next(options);
      }, onError: (DioException e, ErrorInterceptorHandler handler) {
        if (e.response?.statusCode == 401) {
          onTokenExpired();
          return;
        }
        return handler.next(e);
      }),
    ]);
    return dio;
  }

  Map<String, dynamic>? getHeaders();

  void onTokenExpired();
}
