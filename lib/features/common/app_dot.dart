import 'package:flutter/material.dart';

class AppDot extends StatelessWidget {
  const AppDot({
    super.key,
    this.size = 8,
    this.color = Colors.green,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
