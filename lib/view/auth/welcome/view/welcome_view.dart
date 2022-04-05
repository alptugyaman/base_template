import 'package:flutter/material.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/component/button/custom_outlined_button.dart';
import '../../../../core/constant/image/image_constants.dart';
import '../viewmodel/welcome_view_model.dart';

class WelcomeView extends StatefulWidget {
  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends BaseState<WelcomeView> {
  late WelcomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<WelcomeViewModel>(
      viewModel: WelcomeViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onDispose: () {},
      onPageBuilder: () => _body(),
    );
  }

  Scaffold _body() {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
          top: MediaQuery.of(context).padding.top,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            PngManeger.instance.rocketPNG,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomOutlinedButton(
                  onPressed: viewModel.toLogin,
                  child: const Text('Giriş Yap'),
                ),
                CustomOutlinedButton(
                  onPressed: viewModel.toRegister,
                  child: const Text('Kayıt Ol'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
