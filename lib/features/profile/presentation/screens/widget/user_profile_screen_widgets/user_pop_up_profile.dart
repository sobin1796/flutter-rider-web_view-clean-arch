import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_cached_image.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';

class UserPopUpProfile extends StatelessWidget {
  const UserPopUpProfile({
    required this.name,
    required this.avatarUrl,
    super.key,
  });

  final String name;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    const avatarSize = 84.0;
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 340),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 14, 24, 18),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: const Color(0xFFE9ECF4)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF202842).withValues(alpha: 0.12),
                blurRadius: 36,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top row
              Row(
                children: [
                  const Spacer(),
                  Material(
                    color: const Color(0xFFF2F4F9),
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () => Navigator.of(context).pop(),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: Color(0xFF697086),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const VerticalSpacing(0),

              // Profile avatar with gradient ring
              Container(
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF5478FF),
                      Color(0xFFB66BE8),
                      Color(0xFFE94D9B),
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: SizedBox.square(
                      dimension: avatarSize,
                      child: AppCachedImage(
                        imgUrl: avatarUrl,
                        title: name,
                        width: avatarSize,
                        height: avatarSize,
                        fit: BoxFit.cover,
                        defaultIcon: const Icon(
                          Icons.person_rounded,
                          size: 48,
                          color: Color(0xFF9299AA),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const VerticalSpacing(10),
              // User name
              Text(
                name.trim().isEmpty ? 'Tukaatu User' : name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFF202438),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.4,
                  height: 1.25,
                ),
              ),
              const VerticalSpacing(6),
              // User badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: AppColors.primaryBlue.withValues(alpha: 0.12),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person_rounded,
                      size: 15,
                      color: AppColors.primaryBlue,
                    ),
                    HorizontalSpacing(6),
                    Text(
                      'Tukaatu User',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(12),
              // Divider
              Container(height: 1, color: const Color(0xFFEEF0F5)),
              const VerticalSpacing(10),
              // Footer
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_rounded,
                    size: 16,
                    color: Color(0xFFE94D9B),
                  ),
                  HorizontalSpacing(6),
                  Flexible(
                    child: Text(
                      'Connecting people on Tukaatu',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7C8294),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
