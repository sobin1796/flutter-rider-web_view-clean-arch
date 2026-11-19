import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppSwitchTile extends StatelessWidget {
  const AppSwitchTile({
    required this.title,
    required this.value,
    this.padding = 16,
    this.textSubStyle,
    this.subTitle,
    super.key,
    this.onChanged,
    this.textStyle = AppTextStyles.titleSm,
  });

  final void Function(bool)? onChanged;
  final String title;
  final String? subTitle;
  final bool value;
  final TextStyle textStyle;
  final TextStyle? textSubStyle;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      contentPadding: EdgeInsets.symmetric(horizontal: padding),
      title: Text(
        title,
        style: AppTextStyles.textBaseSemiBold.copyWith(
          color: AppColors.primaryBlue,
        ),
      ),
      subtitle: Text(
        subTitle ?? '',
        style: AppTextStyles.textBaseSemiBold.copyWith(
          color: AppColors.grey,
          fontSize: 12,
        ),
      ),
      value: value,
      activeThumbColor: AppColors.neutralWhite,
      activeTrackColor: AppColors.primaryBlue,
      inactiveThumbColor: AppColors.white.withAlpha(99),
      inactiveTrackColor: AppColors.primaryLightBlue.withAlpha(99),
      onChanged: onChanged,
    );
  }
}
