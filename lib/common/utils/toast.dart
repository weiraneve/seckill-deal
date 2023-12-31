import 'package:flutter/material.dart';

class Toast {
  static _toast(BuildContext context, String msg,
      {duration = const Duration(milliseconds: 1000),
      Color? color,
      SnackBarAction? action}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: duration,
      action: action,
      backgroundColor: color ?? Theme.of(context).primaryColor,
    ));
  }

  static void error(BuildContext context, String msg) {
    _toast(
      context,
      msg,
      color: Colors.red,
    );
  }

  static void warning(BuildContext context, String msg) {
    _toast(
      context,
      msg,
      color: Colors.orange,
    );
  }

  static void success(BuildContext context, String msg) {
    _toast(
      context,
      msg,
      color: Colors.green,
    );
  }
}
