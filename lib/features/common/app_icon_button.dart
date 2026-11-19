import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.child,
    required this.onTap,
    this.borderRadius = 90,
    super.key,
    this.padding = 16,
  });
  final double? borderRadius;
  final Widget child;
  final double? padding;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(padding!),
          child: child,
        ),
      ),
    );
  }
}
