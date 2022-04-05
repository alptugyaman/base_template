import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constant/enum/preferences_keys_enum.dart';
import '../../../../core/constant/navigation/navigation_constants.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = SplashViewModelBase with _$SplashViewModel;

abstract class SplashViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    _getToken();
  }

  void toLogin() => navigation.pushRemove(path: NavConstant.LOGIN_VIEW);
  void toHome() => navigation.pushRemove(path: NavConstant.HOME_VIEW);
  void toRegister() => navigation.pushRemove(path: NavConstant.REGISTER_VIEW);
  void toWelcome() => navigation.pushRemove(path: NavConstant.WELCOME_VIEW);

  void _getToken() {
    final String? token = cache.getStringValue(PrefsKey.ACCESS_TOKEN);

    if (kDebugMode) {
      print(token);
    }

    Timer(
      const Duration(seconds: 2),
      token == null ? toWelcome : toHome,
    );
  }
}
