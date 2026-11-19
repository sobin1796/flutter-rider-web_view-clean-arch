import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width = 82});
  final double width;

  @override
  Widget build(BuildContext context) {
    return const Hero(
      tag: 'app-logo',
      child: Icon(Icons.abc),
    );
  }
}
