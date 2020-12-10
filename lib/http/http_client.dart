import 'package:dio/dio.dart';
import 'interceptor/error_interceptor.dart';

enum DomainType { identity, brokerage}

class HttpClient {
  HttpClient(DomainType domainType, {BaseOptions options}) {

    final String _baseUrl = 'https://www.reddit.com';

    options ??= BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 40000,
      receiveTimeout: 40000,
    );

    _dio = Dio(options);

    _dio.interceptors.addAll([
      ErrorInterceptor()
    ],);
  }

  Dio _dio;
  Dio get instance => _dio;
}
