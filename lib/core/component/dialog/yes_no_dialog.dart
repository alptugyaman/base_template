import 'package:base_template/core/component/radius/custom_radius.dart';
import 'package:flutter/material.dart';

class YesNoDialog extends StatefulWidget {
  final String title;
  final String content;
  final Widget first;
  final Widget second;

  const YesNoDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.first,
    required this.second,
  }) : super(key: key);

  @override
  _YesNoDialogState createState() => _YesNoDialogState();
}

class _YesNoDialogState extends State<YesNoDialog> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SimpleDialog(
        contentPadding: EdgeInsets.zero,
        shape: CustomRadius(5),
        title: Column(
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              widget.content,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
          ],
        ),
        children: <Widget>[
          const Divider(
            thickness: 1,
            height: 1,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    child: widget.first,
                  ),
                ),
                const VerticalDivider(
                  thickness: 1,
                  width: 0,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    child: widget.second,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension YesNo on YesNoDialog {
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
