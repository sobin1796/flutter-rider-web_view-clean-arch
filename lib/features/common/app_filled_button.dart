import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    required this.text,
    required this.onPressed,
    this.child,
    super.key,
    this.backgroundColor = AppColors.primaryBlue,
    this.foregroundColor = Colors.white,
    this.borderRadius = 30,
    this.height = 40,
    this.isLoading = false,
    this.padding,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double borderRadius;
  final double height;
  final bool isLoading;
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? const AppLoadingWidget.small(color: AppColors.white, size: 18)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  child ?? const Text(''),
                  const HorizontalSpacing(8),
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
