import 'package:flutter/material.dart';

class MyCustomAlertDialog extends StatefulWidget {
  String title;
  String message;
  Function() onOkBtnClick;

  MyCustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onOkBtnClick
  });

  @override
  State<MyCustomAlertDialog> createState() => _MyCustomAlertDialogState();
}

class _MyCustomAlertDialogState extends State<MyCustomAlertDialog> {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text(widget.title),
      content:  Text(widget.message),
      actions: [
        TextButton(
            onPressed: widget.onOkBtnClick,
            child: const Text('Restart')
        ),
      ],
    );
  }
}