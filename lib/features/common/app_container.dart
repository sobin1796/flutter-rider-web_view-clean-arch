import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    required this.child,
    super.key,
    this.color = AppColors.neutralWhite,
    this.onTap,
    this.width,
    this.borderColor = AppColors.lightGrey,
    this.borderRadius = 8.0,
    this.horizontalPadding = 0.0,
    this.verticalPadding,
    this.horizontalMargin,
    this.verticalMargin,
    this.height,
    this.boxShadow,
  });
  final Color color;
  final void Function()? onTap;
  final double? width;
  final double? height;
  final Color borderColor;
  final double borderRadius;
  final double horizontalPadding;
  final double? horizontalMargin;
  final double? verticalMargin;

  final double? verticalPadding;
  final Widget? child;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      onTap: onTap,
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin ?? 0,
          vertical: verticalMargin ?? 0,
        ),
        width: width,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding ?? 0,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: color,
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
