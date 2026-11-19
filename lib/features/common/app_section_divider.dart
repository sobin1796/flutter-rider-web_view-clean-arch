import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppSectionDivider extends StatelessWidget {
  const AppSectionDivider({super.key});
  @override
  Widget build(BuildContext context) =>
      Container(height: 1, color: AppColors.borderGrey);
}

class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({required this.title, super.key, this.onSeeAll});
  final String title;
  final VoidCallback? onSeeAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.darkGrey,
              letterSpacing: 0.1,
              height: 1,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
