import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/component/button/action_loading_button.dart';
import '../../../../core/component/text_form_field/default_text_form_field.dart';
import '../../../../core/component/text_form_field/password_text_form_field.dart';
import '../../../../core/extension/string_extension.dart';
import '../viewmodel/register_view_model.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView> {
  late RegisterViewModel viewModel;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _val = false;

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
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
                title: 'Register',
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (_formKey.currentState!.validate()) {
                    // print('OK');
                  } else {
                    // print('NOPE');
                  }
                },
              ),
              TextButton(
                onPressed: viewModel.toLogin,
                child: const Text('Hesabım var'),
              ),
              InkWell(
                onTap: viewModel.toLogin,
                child: const Text('Hesabım var'),
              ),
              Transform.scale(
                scale: 1.25,
                child: Checkbox(
                  value: _val,
                  onChanged: (value) {
                    setState(() {
                      _val = value!;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
