import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.labelColor,
    super.key,
    this.verticalPadding,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? labelColor;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColors.primaryBlue.withAlpha(18),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                size: 22,
                color: iconColor ?? AppColors.primaryBlue,
              ),
            ),
            const HorizontalSpacing(16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  color: labelColor ?? AppColors.neutralBlack,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.gray, size: 20),
          ],
        ),
      ),
    );
  }
}
