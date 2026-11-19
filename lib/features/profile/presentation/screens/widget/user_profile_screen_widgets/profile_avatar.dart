import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_cached_image.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({required this.avatar, required this.name, super.key});
  final String avatar;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withAlpha(40),
        borderRadius: BorderRadius.circular(90),
        border: Border.all(color: AppColors.appYellow, width: 2),
      ),
      clipBehavior: Clip.antiAlias,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: AppCachedImage(
          imgUrl: avatar,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          title: name,
          defaultIcon: _fallback(),
        ),
      ),
    );
  }

  Widget _fallback() {
    if (name.isNotEmpty) {
      return Center(
        child: Text(
          name[0].toUpperCase(),
          style: TextStyle(
            color: AppColors.white,
            fontSize: 28.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    }
    return const Center(
      child: Icon(Icons.person, size: 36, color: AppColors.white),
    );
  }
}

class ProfileAvatarLoading extends StatelessWidget {
  const ProfileAvatarLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withAlpha(40),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.appYellow, width: 2),
      ),
      child: const Center(child: AppLoadingWidget.small()),
    );
  }
}
