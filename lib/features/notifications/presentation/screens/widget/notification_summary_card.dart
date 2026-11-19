import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class NotificationSummaryCard extends StatelessWidget {
  const NotificationSummaryCard({
    required this.totalCount,
    required this.unreadCount,
    required this.onMarkAllRead,
    super.key,
  });

  final int totalCount;
  final int unreadCount;
  final VoidCallback onMarkAllRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF08789C), Color(0xFF045D7C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withValues(alpha: .16),
            blurRadius: 16,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: .16),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.notifications_active_outlined,
              color: AppColors.white,
              size: 24,
            ),
          ),
          const HorizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$unreadCount unread notifications',
                  style: AppTextStyles.textBaseSemiBold.copyWith(
                    color: AppColors.white,
                    fontSize: 15,
                  ),
                ),
                const VerticalSpacing(4),
                Text(
                  '$totalCount total notifications',
                  style: AppTextStyles.textSmallRegular.copyWith(
                    color: AppColors.white.withValues(alpha: .78),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.white.withValues(alpha: .14),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: unreadCount == 0 ? null : onMarkAllRead,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Mark read',

                style: AppTextStyles.textSmallRegular.copyWith(
                  color: AppColors.white.withValues(alpha: .78),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
