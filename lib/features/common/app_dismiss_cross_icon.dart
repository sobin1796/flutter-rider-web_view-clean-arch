import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDismissCrossIcon extends StatelessWidget {
  const AppDismissCrossIcon({super.key, this.padding = 16});
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(90),
      ),
      onTap: () {
        context.pop();
      },
      child: Padding(
        padding: EdgeInsets.all(padding!),
        child: const Icon(Icons.delete),
      ),
    );
  }
}
