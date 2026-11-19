import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppMapWidget extends StatelessWidget {
  const AppMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.neutralWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.grey,
        ),
      ),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(20),
        child: const Icon(Icons.abc),
      ),
    );
  }
}
