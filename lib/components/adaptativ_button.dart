import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String? label;
  final Function()? onPressed;

  AdaptativeButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoButton(
        child: Text(label.toString()),
        color: Theme.of(context).primaryColor,
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label.toString(),
          style: TextStyle(color: Theme.of(context).textTheme.button?.color),
        ),
      );
    }
  }
}
