import 'package:flutter/material.dart';

class ButtonCircularProgress extends StatelessWidget {
  const ButtonCircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        strokeWidth: 3,
      ),
    );
  }
}
