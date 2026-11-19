import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_cached_image.dart';

class AppCircularImage extends StatelessWidget {
  const AppCircularImage({
    required this.imageUrl,
    super.key,
    this.size = 40,
    this.borderRadius,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double size;
  final double? borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        borderRadius ?? 90,
      ),
      child: AppCachedImage(
        shimmer: Container(
          color: AppColors.borderGrey,
          height: size,
          width: size,
        ),
        height: size,
        width: size,
        fit: fit,
        imgUrl: imageUrl,
      ),
    );
  }
}
