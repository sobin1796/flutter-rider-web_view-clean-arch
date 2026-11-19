import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_container.dart';
import 'package:tukaatuexpress/features/common/app_ink_well.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.image,
    this.icon,
    super.key,
  });
  final Widget? image;
  final IconData? icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onTap,
      child: AppContainer(
        borderRadius: 16,
        horizontalPadding: 16,
        verticalPadding: 14,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(20),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child:
                        image ??
                        Icon(icon, size: 20, color: AppColors.primaryBlue),
                  ),
                ),
                HorizontalSpacing(12.w),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.textBaseSemiBold.copyWith(
                          color: AppColors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      VerticalSpacing(4.h),
                      Text(
                        subtitle,
                        style: AppTextStyles.textSmallRegular.copyWith(
                          color: AppColors.colors6C757D,
                          fontSize: 12.sp,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                HorizontalSpacing(8.w),
                const Center(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.primaryBlue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
