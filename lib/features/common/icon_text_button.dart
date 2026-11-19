import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton({
    required this.icon,
    required this.label,
    super.key,
    this.onTap,
  });
  final Widget icon;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(48),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color: AppColors.darkGrey),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const HorizontalSpacing(8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.neutralWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
