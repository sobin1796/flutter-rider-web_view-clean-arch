import 'package:flutter/material.dart';
import 'package:tukaatuexpress/features/common/app_ink_well.dart';
import 'package:tukaatuexpress/gen/assets.gen.dart';

class AppDeleteButton extends StatelessWidget {
  const AppDeleteButton({required this.onPressed, super.key});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: onPressed,
      child: Assets.images.delete.image(
        height: 22,
      ),
    );
  }
}
