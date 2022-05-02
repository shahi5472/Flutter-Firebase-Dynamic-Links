import 'package:dio/dio.dart';

import 'api_client.dart';

abstract class NetConnect {
  late Dio _dio;

  late ApiClient apiClient;

  NetConnect() {
    _dio = Dio();
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
    apiClient = ApiClient(_dio);
  }
}
