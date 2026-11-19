import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_text_field_wthout_label.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    required this.title,
    super.key,
    this.fillColor = AppColors.neutralWhite,
    this.isSmallIcon = false,
  });
  final String title;
  final Color fillColor;
  final bool isSmallIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: AppTextFormFieldWithoutLabel(
        borderRadius: BorderRadius.circular(8),
        borderWidth: 0,
        hintText: title,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: isSmallIcon
              ? const Icon(Icons.arrow_back)
              : const Icon(Icons.arrow_back),
        ),
        fillColor: fillColor,
      ),
    );
  }
}
