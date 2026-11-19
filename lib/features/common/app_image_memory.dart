import 'dart:typed_data';
import 'package:flutter/material.dart';

class AppMemoryImage extends StatelessWidget {
  const AppMemoryImage({
    required this.bytes,
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });
  final Uint8List bytes;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    Widget image = Image.memory(
      bytes,
      height: height,
      width: width,
      fit: fit,
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }

    return image;
  }
}
