import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_cached_image.dart';
import 'package:tukaatuexpress/features/common/app_shimmer_container.dart';

class UserProfilePic extends StatelessWidget {
  const UserProfilePic({
    required this.height,
    required this.fontSize,
    super.key,
    // this.user,
  });

  final double height;
  final double fontSize;

  // TODO(sobin): it will be placed after api response
  // final UserResponse? user;

  @override
  Widget build(BuildContext context) {
    // Conditional on whether 'user' is passed
    // if (user != null) {
    //   return _buildImageWidget(
    //     user?.profileImage,
    //     user?.name,
    //   );
    // }

    // Wrap only the reactive part with Obx
    return _buildImageWidget(
      '', '',
      // controller.user.value?.profileImage,
      // controller.user.value?.name,
    );
  }

  // Extracted reusable widget
  Widget _buildImageWidget(String? imagePath, String? name) {
    return ClipOval(
      child: Container(
        alignment: Alignment.center,
        width: height,
        height: height,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primaryLightBlue,
        ),
        child: imagePath == null || imagePath.isEmpty
            ? Text(
                name ?? '',
                style: TextStyle(
                  fontSize: fontSize,
                  color: AppColors.white,
                ),
              )
            : AppCachedImage(
                fit: BoxFit.cover,
                height: height,
                width: height,
                shimmer: const AppShimmerContainer(
                  height: 35,
                ),
                imgUrl: imagePath,
              ),
      ),
    );
  }
}
