import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    required this.label,
    super.key,
    this.onTap,
    this.color = AppColors.neutralWhite,
    this.fontSize = 14,
    this.padding = const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 6,
    ),
  });
  final String label;
  final Color color;
  final double fontSize;
  final void Function()? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: padding,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: color,
            fontSize: fontSize,
            letterSpacing: 0.6,
          ),
        ),
      ),
    );
  }
}
