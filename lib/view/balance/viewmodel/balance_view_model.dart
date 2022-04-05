import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constant/enum/data_enum.dart';
import '../model/balance_model.dart';
import '../service/balance_service.dart';

part 'balance_view_model.g.dart';

class BalanceViewModel = _BalanceViewModelBase with _$BalanceViewModel;

abstract class _BalanceViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    getBalance();
  }

  BalanceService balanceService = BalanceService();

  @observable
  Balance? balance;

  @observable
  Data status = Data.LOADING;

  @action
  Future<void> getBalance() async {
    status = Data.LOADING;
    balance = await balanceService.getBalance();
    status = Data.LOADED;
  }
}
