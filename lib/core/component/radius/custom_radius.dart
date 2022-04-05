import 'package:flutter/material.dart';

class CustomRadius extends RoundedRectangleBorder {
  final double radius;

  CustomRadius(this.radius)
      : super(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        );
}
