import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/constants/app_constant.dart';
import 'package:tukaatuexpress/features/common/app_filled_button.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    this.title = AppConstants.errorMessage,
    super.key,
    this.onTap,
  });

  final String? title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title ?? 'Oops! Something went wrong.',
            style: AppTextStyles.titleSmRegular.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: onTap, child: const Text('Retry')),
          if (Platform.isIOS && context.canPop())
            AppFilledButton(
              text: 'Back',
              onPressed: () {
                context.pop();
              },
            ),
        ],
      ),
    );
  }
}
