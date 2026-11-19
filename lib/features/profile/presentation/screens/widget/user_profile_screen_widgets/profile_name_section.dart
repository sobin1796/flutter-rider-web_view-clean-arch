import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/enum/the_states.dart';
import 'package:tukaatuexpress/features/common/app_ink_well.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/profile/presentation/bloc/profile_state.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class ProfileNameSection extends StatelessWidget {
  const ProfileNameSection({
    required this.state,
    required this.noTokenAvailable,
    super.key,
  });

  final ProfileState state;
  final bool noTokenAvailable;

  @override
  Widget build(BuildContext context) {
    if (noTokenAvailable) {
      return Column(
        children: [
          Text(
            'Welcome to Tukaatu',
            textAlign: TextAlign.center,
            style: AppTextStyles.textBaseSemiBold.copyWith(
              color: AppColors.primaryBlue,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const VerticalSpacing(4),
          AppInkWell(
            onTap: () {},
            child: Text(
              'Sign in to manage your account',
              textAlign: TextAlign.center,
              style: AppTextStyles.textBaseSemiBold.copyWith(
                color: AppColors.appYellow,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      );
    }

    return state.theStates.whenOrElse(
      loading: () => const AppLoadingWidget.small(),
      error: () => AppInkWell(
        onTap: () {},
        child: Text(
          'Log In',
          style: AppTextStyles.textBaseSemiBold.copyWith(
            color: AppColors.appRed,
            fontSize: 12,
          ),
        ),
      ),
      orElse: () => Column(
        children: [
          Text(
            state.profileResponse?.name ?? '',
            style: AppTextStyles.textBaseSemiBold.copyWith(
              color: AppColors.primaryBlue,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          const VerticalSpacing(2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone,
                size: 18,
                color: AppColors.primaryBlue.withAlpha(160),
              ),
              const HorizontalSpacing(4),
              Text(
                state.profileResponse?.phone ?? '',
                style: AppTextStyles.textBaseSemiBold.copyWith(
                  color: AppColors.primaryBlue.withAlpha(160),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
