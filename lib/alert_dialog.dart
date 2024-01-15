import 'package:flutter/material.dart';

class MyCustomAlertDialog extends StatefulWidget {
  const MyCustomAlertDialog({super.key});

  @override
  State<MyCustomAlertDialog> createState() => _MyCustomAlertDialogState();
}

class _MyCustomAlertDialogState extends State<MyCustomAlertDialog> {


  @override
  Widget build(BuildContext context) {
    return AlertDialog();
  }
}
