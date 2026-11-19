import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppIconWithBackgroundColor extends StatelessWidget {
  const AppIconWithBackgroundColor({
    required this.icon, super.key,
    this.iconColor = AppColors.primaryBlue,
    this.backgroundColor, // default soft color
    this.size = 20,
    this.padding = 8,
    this.borderRadius = 8,
  });
  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;
  final double size;
  final double padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryBlue.withAlpha(20),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: size,
      ),
    );
  }
}
