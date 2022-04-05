import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/component/dialog/error_dialog.dart';
import '../model/list_model.dart';
import '../services/list_service.dart';

part 'list_view_model.g.dart';

class ListViewModel = ListViewModelBase with _$ListViewModel;

abstract class ListViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    getLit();
  }

  LitService litService = LitService();

  @observable
  List<ChainList>? lit;

  @action
  Future<void> getLit() async {
    lit = await litService.getLit().catchError((e) {
      ErrorDialog(error: e).show(context!);
    });
  }
}
