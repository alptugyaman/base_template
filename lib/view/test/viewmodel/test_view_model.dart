import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constant/navigation/navigation_constants.dart';
import '../../../core/component/dialog/error_dialog.dart';
import '../model/test_model.dart';
import '../service/test_service.dart';

part 'test_view_model.g.dart';

class TestViewModel = TestViewModelBase with _$TestViewModel;

abstract class TestViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    // getTest();
  }

  TestService testService = TestService();

  @observable
  Test? test;

  @action
  void toRegister() => navigation.pushRemove(path: NavConstant.REGISTER_VIEW);

  @action
  void toHome() => navigation.pushRemove(path: NavConstant.HOME_VIEW);

  @action
  void toExit() {
    cache.clearAllValues();
    navigation.pushRemove(path: NavConstant.LOGIN_VIEW);
  }

  @action
  Future<void> getTest2() async {
    test = await testService.getTest().catchError((e) async {
      await ErrorDialog(error: e).show(context!);
    });
  }

  @action
  Future<void> getTest() async {
    test = await testService.getTest().catchError((e) async {
      await ErrorDialog(error: e).show(context!);
    });
  }
}
