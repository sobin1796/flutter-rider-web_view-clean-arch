import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    this.indent = 1,
    this.endent = 1,
    super.key,
    this.color = AppColors.colorsE9EAEC,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
  });
  final Color color;
  final double indent;
  final double endent;
  final double? verticalPadding;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding!,
        horizontal: horizontalPadding!,
      ),
      child: Divider(
        endIndent: endent,
        indent: indent,
        color: color,
        height: 1,
      ),
    );
  }
}

class GreyDivider extends StatelessWidget {
  const GreyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: AppColors.lightGrey, height: 1);
  }
}
