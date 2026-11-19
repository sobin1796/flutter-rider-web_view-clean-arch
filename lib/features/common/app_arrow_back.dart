import 'package:flutter/material.dart';

class AppArrowBack extends StatelessWidget {
  const AppArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black.withValues(alpha: 0.12),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.all(12),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 15,
          ),
        ),
      ),
    );
  }
}
