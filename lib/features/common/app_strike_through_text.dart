import 'package:flutter/material.dart';
import 'package:tukaatuexpress/features/common/app_container.dart';

class AppStrikeThroughText extends StatelessWidget {
  const AppStrikeThroughText({
    required this.saveAmount,
    required this.discount,
    this.isDiscountAvailable = false,
    super.key,
    this.color,
    this.fontSize = 12,
    this.thickness = 1,
    this.padding = const EdgeInsets.only(top: 16),
  });
  final String discount;
  final String saveAmount;
  final Color? color;
  final double fontSize;
  final double thickness;
  final EdgeInsetsGeometry padding;
  final bool isDiscountAvailable;
  @override
  Widget build(BuildContext context) {
    final textColor = color ?? Colors.red.shade300;
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Text(
            'Rs. $discount',
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              decoration: TextDecoration.lineThrough,
              decorationColor: textColor,
              decorationThickness: thickness,
            ),
          ),
          if (isDiscountAvailable)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: AppContainer(
                borderColor: Colors.green.shade200,
                verticalPadding: 2,
                horizontalPadding: 6,
                color: Colors.green.shade200,
                child: Text(
                  saveAmount,
                  style: const TextStyle(color: Colors.green, fontSize: 12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
