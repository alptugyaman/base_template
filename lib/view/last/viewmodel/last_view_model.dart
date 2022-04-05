import 'package:base_template/view/last/model/last_model.dart';
import 'package:base_template/view/last/service/last_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/component/dialog/error_dialog.dart';

part 'last_view_model.g.dart';

class LastViewModel = LastViewModelBase with _$LastViewModel;

abstract class LastViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    getLit();
  }

  LastBalance lS = LastBalance();

  @observable
  Nutritions? nutritions;

  @action
  Future<void> getLit() async {
    nutritions = await lS.getLast().catchError((e) {
      ErrorDialog(error: e).show(context!);
    });
  }
}
