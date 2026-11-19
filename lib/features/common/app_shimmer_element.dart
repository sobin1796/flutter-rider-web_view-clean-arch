import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppShimmerElement extends StatelessWidget {
  const AppShimmerElement({
    required this.width,
    this.height,
    super.key,
  });
  final double? height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.borderGrey,
      height: height ?? 20,
      width: width ?? 20,
    );
  }
}
