import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/constant/enum/preferences_keys_enum.dart';
import '../../../../core/constant/url/url_constants.dart';
import '../../../../core/init/cache/cache_manager.dart';
import '../../../../core/init/network/dio_manager.dart';
import '../model/login_model.dart';

class LoginService {
  LoginService();

  CacheManager cache = CacheManager.instance;

  Future<Login?> getLogin(String email, String password) async {
    try {
      final _map = {
        "email": email,
        "password": password,
      };

      final response = await DioManager.instance!.dio.post(
        UrlConstant.LOGIN,
        data: _map,
      );

      if (response.statusCode == 200) {
        final Login login =
            Login.fromJson(response.data as Map<String, dynamic>);

        cache.setStringValue(PrefsKey.ACCESS_TOKEN, login.token!);
        cache.setStringValue(PrefsKey.REFRESH_TOKEN, login.refreshToken!);
        cache.setIntValue(PrefsKey.EXPIRE_TIME, login.expiresIn!);
        return login;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw 'NOOO';
      } else if (e is SocketException) {
        throw 'İnternet';
      } else {
        throw 'Sunucu';
      }
    }
  }
}
