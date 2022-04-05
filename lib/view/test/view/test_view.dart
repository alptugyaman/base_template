import 'package:base_template/core/extension/localization_extension.dart';
import 'package:base_template/core/init/language/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../core/component/button/action_loading_button.dart';
import '../viewmodel/test_view_model.dart';

class TestView extends StatefulWidget {
  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
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
    return AppBar(
      actions: _actions,
    );
  }

  List<Widget> get _actions {
    return [_exit()];
  }

  IconButton _exit() {
    return IconButton(
      onPressed: viewModel.toExit,
      icon: const Icon(Icons.exit_to_app),
    );
  }

  Widget _getData() {
    return ActionLoadingButton(
      title: LocaleKeys.hey.locale,
      onPressed: viewModel.getTest,
    );
  }

  Widget _body() {
    return Container(
      margin: mediumHorizontal,
      color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(
            builder: (_) {
              if (viewModel.test == null) {
                return Center(child: Container());
              } else {
                return Center(child: Text(viewModel.test!.title!));
              }
            },
          ),
          _getData(),
        ],
      ),
    );
  }
}
