import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_container.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    required this.title,
    required this.onTap,
    this.icon,
    this.iconWidget,
    this.bgColor,
    super.key,
    this.iconColor,
  });
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final Widget? iconWidget;
  final Color? bgColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Row(
          children: [
            AppContainer(
              width: 42,
              height: 42,
              color: bgColor ?? AppColors.primaryLightExtraBlue.withAlpha(40),
              borderRadius: 14,
              child:
                  iconWidget ??
                  Icon(
                    icon,
                    color: iconColor ?? AppColors.primaryBlue,
                    size: 21,
                  ),
            ),
            const HorizontalSpacing(14),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.textMediumBold.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.gray.withAlpha(99),
            ),
          ],
        ),
      ),
    );
  }
}
