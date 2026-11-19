import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_container.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
    this.width = 170,
    this.onTap,
  });

  final String title;
  final String value;
  final IconData icon;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      onTap: onTap,
      width: width,
      height: 104,
      borderColor: AppColors.transparentDivider,
      borderRadius: 16,
      horizontalPadding: 12,
      verticalPadding: 10,
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withAlpha(22),
          blurRadius: 14,
          spreadRadius: 1,
          offset: const Offset(0, 5),
        ),
      ],
      child: Column(
        children: [
          Row(
            spacing: 8,
            children: [
              AppContainer(
                color: AppColors.appYellow.withAlpha(100),
                verticalPadding: 2,
                horizontalPadding: 2,
                child: Icon(icon, size: 18, color: AppColors.appYellow),
              ),

              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.textMediumSemiBold.copyWith(
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const VerticalSpacing(12),
          Center(
            child: Text(
              value,
              style: AppTextStyles.headingH1.copyWith(
                color: AppColors.darkGrey,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
