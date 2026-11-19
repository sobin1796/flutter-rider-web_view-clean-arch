import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppLabelText extends StatelessWidget {
  const AppLabelText(
      {required this.title, this.color = AppColors.primaryBlue, super.key,});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
