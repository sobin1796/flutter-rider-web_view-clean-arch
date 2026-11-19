import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_container.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/widget/user_profile_screen_widgets/user_profile_image.dart';
import 'package:tukaatuexpress/gen/assets.gen.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      verticalMargin: 0,
      borderColor: AppColors.transparentDivider,
      borderRadius: 0,
      horizontalPadding: 16,
      verticalPadding: 14,
      boxShadow: [
        BoxShadow(
          color: AppColors.black.withAlpha(12),
          blurRadius: 18,
          offset: const Offset(0, 6),
        ),
      ],
      child: Row(
        children: [
          const UserProfileImage(
            height: 50,
            imagePath:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR31XO_O0FB11M5v_TsjjcW3RGC48jsBQ8eNCX1vHLItQ&s=10',
          ),
          const HorizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hi, Fahmi 👋',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.headingH2.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Welcome back Proma',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.textMediumRegular.copyWith(
                    color: AppColors.neutralMediumGray,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const HorizontalSpacing(8),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withAlpha(12),
                  blurRadius: 12,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.darkGrey,
              size: 23,
            ),
          ),
        ],
      ),
    );
  }
}
