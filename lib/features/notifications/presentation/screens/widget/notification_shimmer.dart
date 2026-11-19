import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_shimmer.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';

class NotificationShimmer extends StatelessWidget {
  const NotificationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      itemCount: 6,
      separatorBuilder: (_, __) => const VerticalSpacing(10),
      itemBuilder: (_, __) => AppShimmer(
        child: Container(
          height: 90,
          decoration: BoxDecoration(
            color: AppColors.borderGrey,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
