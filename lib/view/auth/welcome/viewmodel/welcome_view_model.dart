import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constant/navigation/navigation_constants.dart';

part 'welcome_view_model.g.dart';

class WelcomeViewModel = WelcomeViewModelBase with _$WelcomeViewModel;

abstract class WelcomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @action
  void toLogin() => navigation.pushRemove(path: NavConstant.LOGIN_VIEW);

  @action
  void toRegister() => navigation.pushRemove(path: NavConstant.REGISTER_VIEW);
}
