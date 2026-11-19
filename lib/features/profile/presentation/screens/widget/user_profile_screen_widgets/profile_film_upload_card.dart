import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';
import 'package:tukaatuexpress/features/common/app_ink_well.dart';

class ProfileFilmUploadCard extends StatelessWidget {
  const ProfileFilmUploadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      onTap: () {
        context.push(AppRoutes.userFilmSectionScreen);
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 124),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.borderGrey),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBlue.withValues(alpha: .06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned(
                top: -42,
                right: 28,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: AppColors.lightBlue.withValues(alpha: .8),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 24,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue.withValues(alpha: .09),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Icon(
                        Icons.video_camera_back_rounded,
                        color: AppColors.primaryBlue,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 13),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Film Upload',
                            style: TextStyle(
                              color: AppColors.darkBlue,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Upload and manage your videos',
                            style: TextStyle(
                              color: AppColors.neutralGray,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.appYellow,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.cloud_upload_outlined,
                        color: AppColors.darkBlue,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
