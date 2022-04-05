// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceViewModel on _BalanceViewModelBase, Store {
  final _$balanceAtom = Atom(name: '_BalanceViewModelBase.balance');

  @override
  Balance? get balance {
    _$balanceAtom.reportRead();
    return super.balance;
  }

  @override
  set balance(Balance? value) {
    _$balanceAtom.reportWrite(value, super.balance, () {
      super.balance = value;
    });
  }

  final _$statusAtom = Atom(name: '_BalanceViewModelBase.status');

  @override
  Data get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Data value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$getBalanceAsyncAction =
      AsyncAction('_BalanceViewModelBase.getBalance');

  @override
  Future<void> getBalance() {
    return _$getBalanceAsyncAction.run(() => super.getBalance());
  }

  @override
  String toString() {
    return '''
balance: ${balance},
status: ${status}
    ''';
  }
}
