// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LastViewModel on LastViewModelBase, Store {
  final _$nutritionsAtom = Atom(name: 'LastViewModelBase.nutritions');

  @override
  Nutritions? get nutritions {
    _$nutritionsAtom.reportRead();
    return super.nutritions;
  }

  @override
  set nutritions(Nutritions? value) {
    _$nutritionsAtom.reportWrite(value, super.nutritions, () {
      super.nutritions = value;
    });
  }

  final _$getLitAsyncAction = AsyncAction('LastViewModelBase.getLit');

  @override
  Future<void> getLit() {
    return _$getLitAsyncAction.run(() => super.getLit());
  }

  @override
  String toString() {
    return '''
nutritions: ${nutritions}
    ''';
  }
}
