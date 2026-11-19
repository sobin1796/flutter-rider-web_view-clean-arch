import 'package:flutter/material.dart';

class AppInkWell extends StatelessWidget {
  const AppInkWell({
    required this.child,
    super.key,
    this.onTap,
    this.borderRadius,
    this.padding,
    this.doubleTap,
  });
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? doubleTap;

  final BorderRadius? borderRadius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: doubleTap,
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      borderRadius: borderRadius,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
