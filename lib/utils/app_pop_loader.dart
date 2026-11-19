import 'package:flutter/material.dart';

class AppPopLoader {
  static void pop(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }
}
