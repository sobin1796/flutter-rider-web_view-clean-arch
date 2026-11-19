import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_container.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    required this.count,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
    this.icon,
    this.image,
    super.key,
  });
  final IconData? icon;
  final Widget? image;
  final String count;
  final String label;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      borderRadius: 16,
      horizontalPadding: 10,
      verticalPadding: 20,
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withAlpha(20),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: image ?? Icon(icon, size: 24, color: iconColor),
            ),
          ),
          VerticalSpacing(6.h),
          Text(
            count,
            style: AppTextStyles.textLargeBold.copyWith(
              color: AppColors.black,
              fontSize: 18.sp,
            ),
          ),
          VerticalSpacing(2.h),
          Text(
            label,
            style: AppTextStyles.textSmallRegular.copyWith(
              color: AppColors.colors6C757D,
              fontSize: 10.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
