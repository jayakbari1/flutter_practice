import 'package:flutter/material.dart';

class GenericAlertDialogBox extends StatelessWidget {
  final String? title;
  final VoidCallback function;
  final Widget child;
  const GenericAlertDialogBox(
      {Key? key, this.title, required this.function, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      actions: [
        TextButton(onPressed: function, child: child),
      ],
    );
  }
}
