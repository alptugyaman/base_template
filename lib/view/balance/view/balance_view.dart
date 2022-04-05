import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../core/constant/enum/data_enum.dart';
import '../viewmodel/balance_view_model.dart';

class BalanceView extends StatefulWidget {
  @override
  _BalanceViewState createState() => _BalanceViewState();
}

class _BalanceViewState extends BaseState<BalanceView> {
  late BalanceViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<BalanceViewModel>(
      viewModel: BalanceViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onDispose: () {},
      onPageBuilder: () => _scaffold(),
    );
  }

  Scaffold _scaffold() {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Observer(
          builder: (_) {
            switch (viewModel.status) {
              case Data.LOADING:
                return const CircularProgressIndicator();
              case Data.LOADED:
                return Text('${viewModel.balance?.totalUsdValue}');
              case Data.ERROR:
                return const Text('ERROR');
              default:
                return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
