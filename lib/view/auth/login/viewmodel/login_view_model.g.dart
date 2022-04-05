// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on LoginViewModelBase, Store {
  final _$loginAtom = Atom(name: 'LoginViewModelBase.login');

  @override
  Login? get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(Login? value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  final _$getLoginAsyncAction = AsyncAction('LoginViewModelBase.getLogin');

  @override
  Future<void> getLogin(String email, String password) {
    return _$getLoginAsyncAction.run(() => super.getLogin(email, password));
  }

  final _$LoginViewModelBaseActionController =
      ActionController(name: 'LoginViewModelBase');

  @override
  void toRegister() {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
        name: 'LoginViewModelBase.toRegister');
    try {
      return super.toRegister();
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toHome() {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
        name: 'LoginViewModelBase.toHome');
    try {
      return super.toHome();
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
login: ${login}
    ''';
  }
}
