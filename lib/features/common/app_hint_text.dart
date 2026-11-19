import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppHintText extends StatelessWidget {
  const AppHintText({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.hintTextGrey,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
