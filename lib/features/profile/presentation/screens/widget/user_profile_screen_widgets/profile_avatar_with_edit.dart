import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_ink_well.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/widget/user_profile_screen_widgets/profile_avatar.dart';

class ProfileAvatarWithEdit extends StatelessWidget {
  const ProfileAvatarWithEdit({
    required this.avatar,
    required this.name,
    required this.isLoading,
    required this.isEditable,
    required this.onEditTap,
    super.key,
  });

  final String avatar;
  final String name;
  final bool isLoading;
  final bool isEditable;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const ProfileAvatarLoading();

    final profileAvatar = ProfileAvatar(avatar: avatar, name: name);
    if (!isEditable) return profileAvatar;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        profileAvatar,
        Positioned(
          bottom: 3,
          right: -4,
          child: AppInkWell(
            onTap: onEditTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppColors.appGreen,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withValues(alpha: .18),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Icon(
                Icons.edit_rounded,
                size: 16,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
