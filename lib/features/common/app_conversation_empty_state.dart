import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppConversationEmptyState extends StatelessWidget {
  const AppConversationEmptyState({required this.subtitle, super.key});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.chat_bubble_outline_rounded,
            size: 64.sp,
            color: AppColors.neutralLighter,
          ),
          VerticalSpacing(12.h),
          Text(
            'No conversations yet',
            style: AppTextStyles.nunitoHeading2.copyWith(
              color: AppColors.neutralGray,
            ),
          ),
          VerticalSpacing(6.h),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.nunitoHeading3.copyWith(
              color: AppColors.neutralLight,
            ),
          ),
        ],
      ),
    );
  }
}
