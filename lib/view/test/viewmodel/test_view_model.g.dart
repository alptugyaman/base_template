// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TestViewModel on TestViewModelBase, Store {
  final _$testAtom = Atom(name: 'TestViewModelBase.test');

  @override
  Test? get test {
    _$testAtom.reportRead();
    return super.test;
  }

  @override
  set test(Test? value) {
    _$testAtom.reportWrite(value, super.test, () {
      super.test = value;
    });
  }

  final _$getTest2AsyncAction = AsyncAction('TestViewModelBase.getTest2');

  @override
  Future<void> getTest2() {
    return _$getTest2AsyncAction.run(() => super.getTest2());
  }

  final _$getTestAsyncAction = AsyncAction('TestViewModelBase.getTest');

  @override
  Future<void> getTest() {
    return _$getTestAsyncAction.run(() => super.getTest());
  }

  final _$TestViewModelBaseActionController =
      ActionController(name: 'TestViewModelBase');

  @override
  void toRegister() {
    final _$actionInfo = _$TestViewModelBaseActionController.startAction(
        name: 'TestViewModelBase.toRegister');
    try {
      return super.toRegister();
    } finally {
      _$TestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toHome() {
    final _$actionInfo = _$TestViewModelBaseActionController.startAction(
        name: 'TestViewModelBase.toHome');
    try {
      return super.toHome();
    } finally {
      _$TestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toExit() {
    final _$actionInfo = _$TestViewModelBaseActionController.startAction(
        name: 'TestViewModelBase.toExit');
    try {
      return super.toExit();
    } finally {
      _$TestViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
test: ${test}
    ''';
  }
}
