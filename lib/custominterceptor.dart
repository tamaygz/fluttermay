import 'package:dio/dio.dart';

class CustomInterceptor extends Interceptor {
  String? token;

  CustomInterceptor({this.token});

  void updateToken(String newToken) {
    token = newToken;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
