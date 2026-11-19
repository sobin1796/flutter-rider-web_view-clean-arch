import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';

class AppUnsignedInfoTile extends StatelessWidget {
  const AppUnsignedInfoTile({
    required this.title,
    required this.subtitle,
    super.key,
    this.icon = Icons.person_outline_rounded,
    this.badgeIcon = Icons.login_rounded,
    this.buttonText = 'Log in to continue',
    this.footerText = 'Your account and data are secure',
    this.benefits = const [],
    this.onLogin,
  });

  final String title;
  final String subtitle;

  /// Main contextual icon.
  final IconData icon;

  /// Small icon displayed over the main icon.
  final IconData? badgeIcon;

  /// Login button text.
  final String buttonText;

  /// Small text below the button.
  final String? footerText;

  /// Optional small feature list.
  final List<AppUnsignedBenefit> benefits;

  /// Optional callback for refreshing the parent screen after login.
  final Future<void> Function()? onLogin;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight > 44
                  ? constraints.maxHeight - 44
                  : 0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: AppColors.primaryBlue.withAlpha(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryBlue.withAlpha(10),
                        blurRadius: 24,
                        offset: const Offset(0, 9),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // Top decorative circle
                      Positioned(
                        top: -55,
                        right: -55,
                        child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryBlue.withAlpha(7),
                          ),
                        ),
                      ),

                      // Bottom decorative circle
                      Positioned(
                        bottom: -55,
                        left: -55,
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFD026).withAlpha(8),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 20, 18, 16),
                        child: Column(
                          children: [
                            // --------------------------------------------------
                            // ICON
                            // --------------------------------------------------
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 66,
                                  width: 66,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.primaryBlue.withAlpha(9),
                                    border: Border.all(
                                      color: AppColors.primaryBlue.withAlpha(
                                        15,
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColors.primaryBlue
                                              .withAlpha(15),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      icon,
                                      size: 26,
                                      color: AppColors.primaryBlue,
                                    ),
                                  ),
                                ),

                                if (badgeIcon != null)
                                  Positioned(
                                    right: -1,
                                    bottom: 0,
                                    child: Container(
                                      height: 21,
                                      width: 21,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white,
                                        border: Border.all(
                                          color: AppColors.primaryBlue
                                              .withAlpha(12),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withAlpha(10),
                                            blurRadius: 6,
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        badgeIcon,
                                        size: 10,
                                        color: AppColors.primaryBlue,
                                      ),
                                    ),
                                  ),
                              ],
                            ),

                            const SizedBox(height: 14),

                            // --------------------------------------------------
                            // TITLE
                            // --------------------------------------------------
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.2,
                                color: AppColors.neutralBlack,
                              ),
                            ),

                            const SizedBox(height: 5),

                            // --------------------------------------------------
                            // SUBTITLE
                            // --------------------------------------------------
                            Text(
                              subtitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                                height: 1.4,
                                color: AppColors.neutralGray,
                              ),
                            ),

                            // --------------------------------------------------
                            // BENEFITS
                            // --------------------------------------------------
                            if (benefits.isNotEmpty) ...[
                              const SizedBox(height: 15),
                              Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 14,
                                runSpacing: 7,
                                children: benefits.take(3).map((benefit) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        benefit.icon,
                                        size: 15,
                                        color: AppColors.primaryBlue,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        benefit.title,
                                        style: const TextStyle(
                                          fontSize: 10.5,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.neutralGray,
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],

                            const SizedBox(height: 16),

                            // --------------------------------------------------
                            // LOGIN BUTTON
                            // --------------------------------------------------
                            SizedBox(
                              width: double.infinity,
                              height: 44,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (onLogin != null) {
                                    await onLogin!();
                                  } else {
                                    await context.push(AppRoutes.loginScreen);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryBlue,
                                  foregroundColor: AppColors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.login_rounded, size: 17),
                                    const SizedBox(width: 7),
                                    Text(
                                      buttonText,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // --------------------------------------------------
                            // FOOTER
                            // --------------------------------------------------
                            if (footerText != null) ...[
                              const SizedBox(height: 9),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.verified_user_outlined,
                                    size: 12,
                                    color: AppColors.primaryBlue.withAlpha(130),
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: Text(
                                      footerText!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.neutralGray.withAlpha(
                                          170,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ============================================================
// BENEFIT MODEL
// ============================================================

class AppUnsignedBenefit {

  const AppUnsignedBenefit({required this.icon, required this.title});
  final IconData icon;
  final String title;
}
