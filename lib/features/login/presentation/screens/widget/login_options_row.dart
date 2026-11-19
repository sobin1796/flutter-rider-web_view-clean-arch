import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class LoginOptionsRow extends StatelessWidget {
  const LoginOptionsRow({
    required this.onRememberMeChanged,
    required this.onForgotPassword,
    super.key,
  });

  final ValueChanged<bool?> onRememberMeChanged;
  final VoidCallback onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HorizontalSpacing(6),
        Expanded(
          child: Text(
            'Continue Journey with Tukaatu Express.',
            style: AppTextStyles.textMediumRegular.copyWith(
              color: AppColors.gray,
              fontSize: 12,
            ),
          ),
        ),
        Container(
          height: 3,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.grey.withAlpha(100),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
      ],
    );
  }
}
