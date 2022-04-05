// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$currentIndexAtom = Atom(name: '_HomeViewModelBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$childrenAtom = Atom(name: '_HomeViewModelBase.children');

  @override
  List<Widget> get children {
    _$childrenAtom.reportRead();
    return super.children;
  }

  @override
  set children(List<Widget> value) {
    _$childrenAtom.reportWrite(value, super.children, () {
      super.children = value;
    });
  }

  final _$onTabTappedAsyncAction =
      AsyncAction('_HomeViewModelBase.onTabTapped');

  @override
  Future<void> onTabTapped(int index) {
    return _$onTabTappedAsyncAction.run(() => super.onTabTapped(index));
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
children: ${children}
    ''';
  }
}
