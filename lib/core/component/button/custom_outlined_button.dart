// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';

class CustomOutlinedButton extends OutlinedButton {
  final Widget child;
  final void Function()? onPressed;

  CustomOutlinedButton({
    required this.child,
    required this.onPressed,
  }) : super(
          child: child,
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            elevation: 0,
            primary: Colors.red,
            onSurface: Colors.red,
            side: const BorderSide(color: Colors.red),
            textStyle: const TextStyle(fontSize: 14),
          ),
        );
}
