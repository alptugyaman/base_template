import 'package:flutter/material.dart';

import '../circular_progress/button_circular.dart';

typedef FutureCallBack = Future<void> Function();

class ActionLoadingButton extends StatefulWidget {
  const ActionLoadingButton({
    Key? key,
    required this.title,
    this.buttonStyle,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final ButtonStyle? buttonStyle;
  final FutureCallBack onPressed;
  @override
  _ActionLoadingButtonState createState() => _ActionLoadingButtonState();
}

class _ActionLoadingButtonState extends State<ActionLoadingButton> {
  bool _isLoading = false;

  void _changeIsLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _completeAction() async {
    _changeIsLoading();
    await widget.onPressed();
    _changeIsLoading();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _completeAction,
      style: widget.buttonStyle,
      child: _isLoading ? const ButtonCircularProgress() : Text(widget.title),
    );
  }
}

class CircularActionLoadingButton extends StatelessWidget {
  const CircularActionLoadingButton({
    Key? key,
    required this.title,
    required this.onComplete,
  }) : super(key: key);
  final String title;

  final Future<void> Function(String token) onComplete;

  @override
  Widget build(BuildContext context) {
    return ActionLoadingButton(
      title: title,
      buttonStyle: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
      onPressed: () async {
        onComplete(title);
      },
    );
  }
}
