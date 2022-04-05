// ignore_for_file: overridden_fields

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../constant/app/app_constants.dart';
import 'network_interceptor.dart';

class DioManager {
  static DioManager? _instance;
  static DioManager? get instance {
    return _instance ??= DioManager._init();
  }

  late Dio _dio;

  DioManager._init() {
    final _options = BaseOptions(
      baseUrl: AppConstant.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
    );

    _dio = CoreDio(_options);
  }

  Dio get dio => _dio;
}

class CoreDio with DioMixin implements Dio {
  @override
  final BaseOptions options;

  CoreDio(this.options) {
    options = options;

    interceptors
      ..add(NetworkInterceptor())
      ..add(LogInterceptor());
    httpClientAdapter = DefaultHttpClientAdapter();
  }
}
