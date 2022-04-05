import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../viewmodel/list_view_model.dart';

class LitView extends StatefulWidget {
  @override
  _LitViewState createState() => _LitViewState();
}

class _LitViewState extends BaseState<LitView> {
  late ListViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<ListViewModel>(
      viewModel: ListViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onPageBuilder: () => _scaffold(),
    );
  }

  Scaffold _scaffold() {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar();
  }

  Widget _body() {
    return Observer(
      builder: (_) {
        if (viewModel.lit == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.lit!.isNotEmpty) {
          return _list();
        } else if (viewModel.lit!.isEmpty) {
          return const Center(child: Text('NOPE'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  ListView _list() {
    return ListView.builder(
      itemCount: viewModel.lit!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final _lit = viewModel.lit![index];
        return ListTile(
          title: Text(_lit.name),
          subtitle: Text(_lit.usdValue.toStringAsFixed(2)),
        );
      },
    );
  }
}
