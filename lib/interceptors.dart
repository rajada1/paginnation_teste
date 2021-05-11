import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CustomInterceptors extends InterceptorsWrapper {
  var time = DateTime.now();
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST [${options.method}] => PATH ${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('RESPONSE[${response.statusCode}]=> PATH ${response.realUri}');
    super.onResponse(response, handler);
  }
}
