import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../../core/constant/navigation/navigation_constants.dart';
import '../model/login_model.dart';
import '../service/login_service.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @action
  void toRegister() => navigation.pushRemove(path: NavConstant.REGISTER_VIEW);

  @action
  void toHome() => navigation.pushRemove(path: NavConstant.HOME_VIEW);

  LoginService loginService = LoginService();

  @observable
  Login? login;

  @action
  Future<void> getLogin(String email, String password) async {
    login = await loginService.getLogin(email, password).catchError(
      (e) async {
        await _errorDialog(e);
      },
    ).then((value) {
      if (value != null) {
        navigation.pushRemove(path: NavConstant.HOME_VIEW);
      }
    });
  }

  Future<dynamic> _errorDialog(e) {
    return showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          title: Text(e.toString()),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}
