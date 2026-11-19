import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    required this.onPressed,
    this.child,
    super.key,
    this.borderRadius,
    this.horizontalPadding,
    this.verticalPadding,
    this.backgroundColor,
    this.elevation,
    this.text,
    this.suffixIcon,
  });
  final VoidCallback onPressed;
  final Widget? child;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? elevation;
  final String? text;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.primaryBlue,
        foregroundColor: AppColors.white,
        elevation: elevation ?? 0,
        minimumSize: Size.zero,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 16,
          vertical: verticalPadding ?? 6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          side: BorderSide(color: backgroundColor ?? AppColors.primaryBlue),
        ),
      ),
      child:
          child ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text ?? '',
                style: const TextStyle(fontSize: 12, color: AppColors.white),
              ),
              if (suffixIcon != null) ...[
                const SizedBox(width: 8),
                suffixIcon!,
              ],
            ],
          ),
    );
  }
}
