import 'package:base_template/product/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions o, RequestInterceptorHandler handler) {
    return super.onRequest(o, handler);
  }

  @override
  void onResponse(Response r, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      logOrange('<<-- RES [${r.statusCode}] => PATH: ${r.requestOptions.path}');
    }

    return super.onResponse(r, handler);
  }

  @override
  Future<void> onError(DioError e, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      logRed(
        '!E [${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
      );
    }

    return super.onError(e, handler);
  }
}
