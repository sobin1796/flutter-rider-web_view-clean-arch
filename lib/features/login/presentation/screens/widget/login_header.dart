import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Start Your Journey',
          textAlign: TextAlign.center,
          style: AppTextStyles.headingH1.copyWith(
            color: AppColors.appYellow,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Login to access your account',
          textAlign: TextAlign.center,
          style: AppTextStyles.textMediumRegular.copyWith(
            color: AppColors.grey,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
