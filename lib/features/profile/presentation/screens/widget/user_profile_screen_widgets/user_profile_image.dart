import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_cached_image.dart';
import 'package:tukaatuexpress/features/common/app_shimmer.dart';

class UserProfileImage extends StatelessWidget {
  const UserProfileImage({
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.name,
    super.key,
    this.height = 35,
    this.fontSize = 20,
    this.backgroundColor = AppColors.subTitleGrey,
  });
  final String imagePath;
  final double height;
  final String? name;
  final BoxFit fit;
  final Color? backgroundColor;

  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
      child: imagePath.isNotEmpty
          ? ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: AppCachedImage(
                defaultIcon: const Icon(
                  Icons.person,
                  size: 80,
                  color: AppColors.white,
                ),
                shimmer: AppShimmer(
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                imgUrl: imagePath,
                width: height,
                height: height,
                fit: fit,
              ),
            )
          : (name != null && name!.isNotEmpty)
          ? Center(
              child: Text(
                name![0].toUpperCase(),
                style: TextStyle(
                  color: AppColors.neutralWhite,
                  fontSize: fontSize,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : const Icon(Icons.person, size: 24, color: AppColors.white),
    );
  }
}
