import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class EmptyNotificationState extends StatelessWidget {
  const EmptyNotificationState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withValues(alpha: .08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_none_rounded,
                color: AppColors.primaryBlue,
                size: 30,
              ),
            ),
            const VerticalSpacing(14),
            Text(
              'No notifications here',
              style: AppTextStyles.textBaseSemiBold.copyWith(
                color: AppColors.black,
              ),
            ),
            const VerticalSpacing(4),
            Text(
              'New updates will appear as soon as they arrive.',
              textAlign: TextAlign.center,
              style: AppTextStyles.textSmallRegular.copyWith(
                color: AppColors.colors6C757D,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
