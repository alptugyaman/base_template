import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/component/button/action_loading_button.dart';
import '../../../../core/component/text_form_field/default_text_form_field.dart';
import '../../../../core/component/text_form_field/password_text_form_field.dart';
import '../../../../core/extension/string_extension.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  late LoginViewModel viewModel;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
        viewModel = model;
      },
      onDispose: () {
        _emailController.dispose();
        _passwordController.dispose();
      },
      onPageBuilder: () => GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: _body(),
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      ),
    );
  }

  Scaffold _body() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(
          5.w,
          MediaQuery.of(context).padding.top,
          5.w,
          isKeyboardClose ? 0 : MediaQuery.of(context).padding.top,
        ),
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextFormField(
                controller: _emailController,
                title: 'Email',
                textInputType: TextInputType.text,
                validator: (value) => value!.isValidEmail,
              ),
              const SizedBox(height: 20),
              PasswordTextFormField(
                controller: _passwordController,
                title: 'Şifre',
                validator: (value) => value!.isValidPassword,
              ),
              const SizedBox(height: 20),
              ActionLoadingButton(
                title: 'Giriş Yap',
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState!.validate()) {
                    viewModel.getLogin(
                      _emailController.text,
                      _passwordController.text,
                    );
                  } else {
                    // print('NOPE');
                  }
                },
              ),
              TextButton(
                onPressed: viewModel.toRegister,
                child: const Text('Şifremi Unuttum'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
