import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/common/app_text_form_field.dart';
import 'package:tukaatuexpress/features/common/app_validators.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class LoginPasswordField extends StatefulWidget {
  const LoginPasswordField({required this.controller, super.key});

  final TextEditingController controller;

  @override
  State<LoginPasswordField> createState() => LoginPasswordFieldState();
}

class LoginPasswordFieldState extends State<LoginPasswordField> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: AppTextStyles.textMediumRegular.copyWith(
            color: AppColors.darkGrey,
            fontSize: 13,
          ),
        ),
        const VerticalSpacing(6),
        AppTextFormField(
          controller: widget.controller,
          hintText: 'Enter your password',
          suffixIcon: IconButton(
            tooltip: obscurePassword ? 'Show password' : 'Hide password',
            onPressed: () => setState(() => obscurePassword = !obscurePassword),
            icon: Icon(
              obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: AppColors.gray,
              size: 19,
            ),
          ),
          obscureText: obscurePassword,
          textInputAction: TextInputAction.done,
          autofillHints: const [AutofillHints.password],
          validator: validateLoginPassword,
          style: AppTextStyles.textMediumRegular.copyWith(
            color: AppColors.darkGrey,
          ),
          hintStyle: AppTextStyles.textMediumRegular.copyWith(
            color: AppColors.neutralLight,
          ),
          enabledBorderSide: const BorderSide(color: AppColors.borderGrey),
          borderRadius: BorderRadius.circular(14),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ],
    );
  }
}

String? validateLoginPassword(String? value) {
  return AppValidators.required(value, 'Enter your password');
}
