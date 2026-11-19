import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/Injectable/injectable.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/core/preferences/preferences.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/gen/assets.gen.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';
import 'package:tukaatuexpress/utils/user_info_validator_utills.dart';

class AuthGuard {
  static Future<bool> checkLogin(
    BuildContext context, {
    bool isForCheckout = false,
  }) async {
    final preferences = getIt<Preferences>();
    final token = await preferences.getString(Preference.accessToken);
    if (token != null && token.isNotEmpty) {
      if (!context.mounted) return false;
      return UserInfoValidatorUtils.checkUserName(
        context,
        isForCheckout: isForCheckout,
      );
    }
    if (!context.mounted) return false;
    final shouldLogin = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      builder: (dialogContext) => const _AuthDialog(),
    );
    if (shouldLogin == true && context.mounted) {
      context.push(AppRoutes.loginScreen);
    }
    return false;
  }
}

class _AuthDialog extends StatelessWidget {
  const _AuthDialog();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.neutralWhite,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryBlue.withValues(alpha: 0.12),
              blurRadius: 32,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header gradient banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primaryBlue, Color(0xFF0A4F6A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const VerticalSpacing(12),
                  Assets.images.tukaatuMainLogo.image(
                    height: 40,
                    width: 150,
                    fit: BoxFit.cover,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              child: Column(
                children: [
                  Text(
                    'Login Required',
                    style: AppTextStyles.textLargeSemiBold.copyWith(
                      color: AppColors.darkBlue,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'You need to be logged in to continue.\nJoin Tukaatu to explore and shop!',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textMediumRegular.copyWith(
                      color: AppColors.neutralMediumGray,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Login button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primaryBlue, Color(0xFF0A4F6A)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryBlue.withValues(
                              alpha: 0.35,
                            ),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Login Now',
                          style: AppTextStyles.textMediumSemiBold.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Cancel button
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: AppColors.borderGrey),
                        ),
                      ),
                      child: Text(
                        'Maybe Later',
                        style: AppTextStyles.textMediumRegular.copyWith(
                          color: AppColors.neutralMediumGray,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
