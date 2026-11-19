import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    required this.value,
    required this.onChanged,
    super.key,
    this.size = 22,
    this.borderRadius = 5,
    this.checkedColor = AppColors.primaryBlue,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final double size;
  final double borderRadius;
  final Color checkedColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: value ? checkedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: value ? checkedColor : AppColors.gray.withAlpha(120),
            width: 1.5,
          ),
        ),
        child: value
            ? const Icon(Icons.check, size: 15, color: Colors.white)
            : null,
      ),
    );
  }
}
