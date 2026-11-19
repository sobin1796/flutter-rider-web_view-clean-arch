import 'package:flutter/material.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';

class UiHelper {
  static void showLoaderDialog(BuildContext context, {bool canPop = false}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AppLoadingWidget.small();
      },
    );
  }
}
