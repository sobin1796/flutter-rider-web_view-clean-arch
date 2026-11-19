import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';
import 'package:tukaatuexpress/utils/app_utils.dart';

class AppColorPaddedContainer extends StatelessWidget {
  const AppColorPaddedContainer({
    this.verticalMargin = 8,
    this.verticalPadding = 16,
    this.horizontalPadding = 16,
    this.title,
    this.trailing,
    this.subTitle,
    this.extraWidget,
    this.borderRadius = 24,
    super.key,
    this.backgroundColor,
  });
  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;
  final double verticalMargin;

  final Widget? extraWidget;
  final String? title;
  final String? subTitle;
  final Widget? trailing;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: verticalMargin),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.lightBlue,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: extraWidget.isNotNull
          ? extraWidget
          : ListTile(
              title: Text(title ?? '', style: AppTextStyles.headingH2),
              subtitle: Text(
                subTitle ?? '',
                style: AppTextStyles.textMediumMedium,
              ),
              trailing: trailing ?? const SizedBox.shrink(),
            ),
    );
  }
}
