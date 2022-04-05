import 'package:base_template/core/component/radius/custom_radius.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatefulWidget {
  final String title;
  final String content;

  const InfoDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  _InfoDialogState createState() => _InfoDialogState();
}

class _InfoDialogState extends State<InfoDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SimpleDialog(
        shape: CustomRadius(5),
        titleTextStyle: const TextStyle(
          color: Color(0xFFF15A29),
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
        title: Center(child: Text(widget.title)),
        children: <Widget>[
          Text(
            widget.content,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 1),
          Center(
            child: SimpleDialogOption(
              child: const Text(
                'Tamam',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

extension Info on InfoDialog {
  Future<T?> show<T>(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return this;
      },
    );
  }
}
