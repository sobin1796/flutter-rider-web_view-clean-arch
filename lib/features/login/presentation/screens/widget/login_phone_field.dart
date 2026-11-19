import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/common/app_text_form_field.dart';
import 'package:tukaatuexpress/features/common/app_validators.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class LoginPhoneField extends StatelessWidget {
  const LoginPhoneField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone number',
          style: AppTextStyles.textMediumRegular.copyWith(
            color: AppColors.darkGrey,
            fontSize: 13,
          ),
        ),
        const VerticalSpacing(6),
        AppTextFormField(
          controller: controller,
          hintText: 'Enter your phone number',
          textInputType: TextInputType.phone,
          autofillHints: const [AutofillHints.telephoneNumber],
          validator: validatePhoneNumber,
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

String? validatePhoneNumber(String? value) {
  return AppValidators.validatePhoneNumber(value);
}
