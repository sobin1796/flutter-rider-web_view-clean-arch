import 'package:flutter/material.dart';

import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppOfferTag extends StatelessWidget {
  const AppOfferTag({
    super.key,
    this.text = 'OFFER',
    this.icon = Icons.local_offer_rounded,
    this.iconSize = 10,
    this.fontSize = 8,
    this.horizontalPadding = 7,
    this.verticalPadding = 3,
    this.iconSpacing = 3,
    this.borderRadius = 5,
    this.margin = const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
    this.backgroundColor = AppColors.appRed,
    this.textColor = AppColors.white,
    this.iconColor = AppColors.white,
    this.showShadow = true,
  });

  final String text;
  final IconData? icon;
  final double iconSize;
  final double fontSize;
  final double horizontalPadding;
  final double verticalPadding;
  final double iconSpacing;
  final double borderRadius;
  final EdgeInsetsGeometry margin;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withAlpha(35),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: ClipPath(
        clipper: const _OfferTagClipper(),
        child: Container(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding + 6,
            verticalPadding,
            horizontalPadding,
            verticalPadding,
          ),
          decoration: BoxDecoration(color: backgroundColor),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, color: iconColor, size: iconSize),
                SizedBox(width: iconSpacing),
              ],
              Text(
                text,
                style: AppTextStyles.captionSemiBold.copyWith(
                  fontSize: fontSize,
                  color: textColor,
                  letterSpacing: 0.7,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OfferTagClipper extends CustomClipper<Path> {
  const _OfferTagClipper();

  @override
  Path getClip(Size size) {
    const radius = 4.0;
    final right = size.width;
    final bottom = size.height;
    final path = Path()
      ..moveTo(8, 0)
      ..lineTo(right - radius, 0)
      ..quadraticBezierTo(right, 0, right, radius)
      ..lineTo(right, bottom - radius)
      ..quadraticBezierTo(right, bottom, right - radius, bottom)
      ..lineTo(8, bottom)
      ..quadraticBezierTo(6, bottom, 2, size.height / 2 + 2)
      ..quadraticBezierTo(0, size.height / 2, 2, size.height / 2 - 2)
      ..quadraticBezierTo(6, 0, 8, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
