import 'package:base_template/product/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constant/enum/preferences_keys_enum.dart';
import '../cache/cache_manager.dart';

class NetworkInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions o, RequestInterceptorHandler handler) {
    final String? accessToken =
        CacheManager.instance.getStringValue(PrefsKey.ACCESS_TOKEN);

    if (accessToken != null) {
      o.headers['Authorization'] = accessToken;
    }

    return super.onRequest(o, handler);
  }

  @override
  Future<void> onError(DioError e, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      logRed(
        '!E [${e.response?.statusCode}] => PATH: ${e.requestOptions.path}',
      );
    }

    if (e.response?.statusCode == 401) {}

    return super.onError(e, handler);
  }
}
