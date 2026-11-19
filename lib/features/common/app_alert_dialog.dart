import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_outlined_button.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmText = 'Delete',
    this.cancelText = 'Cancel',
    super.key,
    this.widget,
  });
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final VoidCallback onConfirm;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      contentPadding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
      actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: AppColors.neutralWhite,
      title: Column(
        children: [
          widget ??
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.appRed.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delete_outline_rounded,
                  color: AppColors.appRed,
                  size: 28,
                ),
              ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.textLargeSemiBold.copyWith(
              color: AppColors.black,
              fontSize: 18,
            ),
          ),
        ],
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: AppTextStyles.titleSm.copyWith(color: AppColors.black),
      ),
      actions: [
        const VerticalSpacing(12),
        Row(
          children: [
            Expanded(
              child: AppOutlinedButton.white(
                height: 44,
                borderRadius: 14,
                textStyle: AppTextStyles.textMediumRegular.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                text: cancelText,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AppOutlinedButton(
                height: 44,
                backgroundColor: AppColors.appRed,
                borderRadius: 14,
                textStyle: AppTextStyles.textMediumRegular.copyWith(
                  color: AppColors.neutralWhite,
                  fontWeight: FontWeight.w600,
                ),
                text: confirmText,
                onPressed: onConfirm,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
