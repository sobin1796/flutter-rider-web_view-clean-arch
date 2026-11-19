import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    required this.isRead,
    required this.title,
    required this.message,
    required this.time,
    super.key,
  });

  final bool isRead;
  final String title;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    final accentColor = isRead
        ? const Color.fromARGB(255, 91, 100, 108)
        : AppColors.primaryBlue;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.fromLTRB(10, 12, 14, 12),
      decoration: BoxDecoration(
        color: isRead
            ? AppColors.white
            : AppColors.primaryBlue.withValues(alpha: .055),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isRead
              ? AppColors.borderGrey
              : AppColors.primaryBlue.withValues(alpha: .22),
        ),
        boxShadow: [
          BoxShadow(
            color: accentColor.withValues(alpha: isRead ? .025 : .08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 3,
            height: 64,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: isRead ? AppColors.borderGrey : AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: isRead ? .08 : .13),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: AppColors.primaryBlue,
                  size: 22,
                ),
              ),
              if (!isRead)
                Positioned(
                  top: -1,
                  right: -1,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.appRed,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 1.5),
                    ),
                  ),
                ),
            ],
          ),
          const HorizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.textMediumSemiBold.copyWith(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const HorizontalSpacing(8),
                    if (!isRead)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlue.withValues(alpha: .1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'NEW',
                          style: TextStyle(
                            color: AppColors.primaryBlue,
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            letterSpacing: .3,
                          ),
                        ),
                      ),
                    const HorizontalSpacing(6),
                    Text(
                      time,
                      style: AppTextStyles.captionRegular.copyWith(
                        color: AppColors.gray,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const VerticalSpacing(6),
                Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.textSmallRegular.copyWith(
                    color: AppColors.colors6C757D,
                    height: 1.35,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
