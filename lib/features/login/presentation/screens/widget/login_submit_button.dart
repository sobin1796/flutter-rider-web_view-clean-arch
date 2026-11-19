import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_elevated_button.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: AppElevatedButton(
        onPressed: onPressed,
        backgroundColor: AppColors.primaryBlue,
        borderRadius: 14,
        child: Text(
          'Login',
          style: AppTextStyles.textMediumBold.copyWith(
            color: AppColors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
