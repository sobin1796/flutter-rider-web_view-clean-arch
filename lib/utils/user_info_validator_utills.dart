import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class UserInfoValidatorUtils {
  static Future<bool> checkUserName(
    BuildContext context, {
    bool isForCheckout = false,
  }) async {
    if (!context.mounted) return false;
    final profileCubit = context.read<ProfileCubit>();
    if (profileCubit.state.profileResponse == null) {
      final profileLoaded = await profileCubit.fetchProfile();
      if (!profileLoaded || !context.mounted) return false;
    }
    // if (isForCheckout &&
    //     (profileCubit.state.profileResponse?.phone?.trim().isNotEmpty !=
    //         true)) {
    //   AppUtils.showErrorSnackbar(
    //     message:
    //         'Checkout is available only for users in Nepal with a valid phone number.',
    //   );
    //   return false;
    // }
    final name = profileCubit.state.profileResponse?.name?.trim() ?? '';
    if (_hasUserName(name)) return true;
    if (!context.mounted) return false;
    final shouldEditProfile = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => _CompleteProfileDialog(
        onLater: () => Navigator.of(dialogContext).pop(false),
        onAddName: () => Navigator.of(dialogContext).pop(true),
      ),
    );
    if (shouldEditProfile == true) {
      await AppRoutes.router.push(AppRoutes.editProfileScreen);
      if (!context.mounted) return false;
      final updatedName =
          context.read<ProfileCubit>().state.profileResponse?.name?.trim() ??
          '';
      return _hasUserName(updatedName);
    }
    return false;
  }

  static bool _hasUserName(String name) =>
      name.isNotEmpty && name.toLowerCase() != 'customer';
}

class _CompleteProfileDialog extends StatelessWidget {
  const _CompleteProfileDialog({
    required this.onLater,
    required this.onAddName,
  });

  final VoidCallback onLater;
  final VoidCallback onAddName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.neutralWhite,
      insetPadding: const EdgeInsets.symmetric(horizontal: 36),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.appYellow.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline_rounded,
                color: AppColors.primaryBlue,
                size: 25,
              ),
            ),
            const VerticalSpacing(14),
            Text(
              'Complete your profile',
              textAlign: TextAlign.center,
              style: AppTextStyles.textLargeSemiBold.copyWith(
                color: AppColors.darkBlue,
                fontSize: 17,
              ),
            ),
            const VerticalSpacing(6),
            Text(
              'Add your name to continue.',
              textAlign: TextAlign.center,
              style: AppTextStyles.textMediumRegular.copyWith(
                color: AppColors.neutralMediumGray,
                height: 1.35,
                fontSize: 13,
              ),
            ),
            const VerticalSpacing(18),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: FilledButton(
                onPressed: onAddName,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                child: const Text('Add your name'),
              ),
            ),
            const VerticalSpacing(4),
            TextButton(
              onPressed: onLater,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.neutralMediumGray,
                minimumSize: const Size.fromHeight(36),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('Maybe later'),
            ),
          ],
        ),
      ),
    );
  }
}
