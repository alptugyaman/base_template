import 'package:flutter/material.dart';

class DefaultTextFormField extends TextFormField {
  DefaultTextFormField({
    Key? key,
    required TextEditingController controller,
    required String title,
    required String? Function(String?)? validator,
    bool obscure = false,
    TextInputType textInputType = TextInputType.emailAddress,
    TextCapitalization textCapitalization = TextCapitalization.none,
    Widget? suffixIcon,
  }) : super(
          key: key,
          autocorrect: false,
          obscureText: obscure,
          controller: controller,
          keyboardType: textInputType,
          enableSuggestions: false,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(suffixIcon: suffixIcon, hintText: title),
          validator: validator,
        );
}
