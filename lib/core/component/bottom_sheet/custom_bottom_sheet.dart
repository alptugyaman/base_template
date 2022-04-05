import 'package:flutter/material.dart';

class UserSelectSheet extends StatelessWidget {
  const UserSelectSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final _bottomPadding = MediaQuery.of(context).padding.bottom;
    return WillPopScope(
      onWillPop: () async => false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            indent: 150,
            endIndent: 150,
            thickness: 2.5,
            color: Colors.grey.shade300,
          ),
          const SizedBox(height: 15),
          child,
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Kapat'),
          ),
          SizedBox(
            height: _bottomPadding == 0 ? 15 : _bottomPadding,
          )
        ],
      ),
    );
  }
}

extension UserSelectSheetExtension on UserSelectSheet {
  Future<T?> show<T>(BuildContext context) {
    return showModalBottomSheet<T>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      builder: (context) {
        return this;
      },
    );
  }
}
