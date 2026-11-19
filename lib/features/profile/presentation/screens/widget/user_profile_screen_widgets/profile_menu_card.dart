import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';
import 'package:tukaatuexpress/features/common/app_divider.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/profile/presentation/model/profile_menu_details_route_args.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/widget/user_profile_screen_widgets/profile_film_upload_card.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/widget/user_profile_screen_widgets/profile_menu_item.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/widget/user_profile_screen_widgets/profile_navigation_card.dart';

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    required this.noTokenAvailable,
    required this.onLogout,
    this.onLogin,
    this.showFilmUploadCard = true,
    this.showBrandHeader = true,
    this.compactTiles = false,
    super.key,
  });
  final bool noTokenAvailable;
  final VoidCallback onLogout;
  final Future<void> Function()? onLogin;
  final bool showFilmUploadCard;
  final bool showBrandHeader;
  final bool compactTiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
      child: Column(
        children: [
          if (showBrandHeader) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.darkBlue, AppColors.primaryBlue],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryBlue.withValues(alpha: .16),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: AppColors.white.withValues(alpha: .14),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.grid_view_rounded,
                      color: AppColors.white,
                      size: 23,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tukaatu',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Your profile and account',
                          style: TextStyle(
                            color: AppColors.white.withValues(alpha: .76),
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.auto_awesome_rounded,
                    color: AppColors.appYellow.withValues(alpha: .95),
                    size: 21,
                  ),
                ],
              ),
            ),
            const VerticalSpacing(14),
          ],
          if (!compactTiles && !noTokenAvailable && showFilmUploadCard) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Creator tools',
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const VerticalSpacing(8),
          ],
          if (compactTiles) ...[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 4),
                child: Text(
                  'Your account',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            if (noTokenAvailable) ...[
              ProfileMenuItem(
                icon: Icons.redeem,
                label: 'Coupons',
                onTap: () => context.push(AppRoutes.couponsScreen),
              ),
              ProfileMenuItem(
                icon: Icons.receipt_long_outlined,
                label: 'Orders',
                onTap: () => context.push(AppRoutes.ordersScreen),
              ),

              ProfileMenuItem(
                icon: Icons.login_rounded,
                label: 'Log In',
                onTap: () async {
                  if (onLogin != null) {
                    await onLogin!();
                  } else {
                    await context.push<bool>(AppRoutes.loginScreen);
                  }
                },
              ),
            ] else ...[
              const AppDivider(),
              const VerticalSpacing(4),
              // ProfileMenuItem(
              //   icon: Icons.monetization_on_outlined,
              //   label: 'Monetization',
              //   onTap: () =>
              //       context.push(AppRoutes.monetizationDashboardScreen),
              // ),
              ProfileMenuItem(
                verticalPadding: 4,
                icon: Icons.redeem,
                label: 'Coupons',
                onTap: () => context.push(AppRoutes.couponsScreen),
              ),
              ProfileMenuItem(
                icon: Icons.receipt_long_outlined,
                label: 'Orders',
                onTap: () => context.push(AppRoutes.ordersScreen),
              ),
              ProfileMenuItem(
                verticalPadding: 4,
                icon: Icons.location_on_outlined,
                label: 'Addresses',
                onTap: () => context.push(AppRoutes.savedAddressesScreen),
              ),
              ProfileMenuItem(
                icon: Icons.bookmark_outline,
                label: 'Marked',
                onTap: () => context.push(AppRoutes.markScreen),
              ),
              const AppDivider(),
              const VerticalSpacing(8),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Others',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const VerticalSpacing(4),
              ProfileMenuItem(
                verticalPadding: 4,
                icon: Icons.manage_accounts_outlined,
                label: 'Account',
                onTap: () {
                  context.push<void>(
                    AppRoutes.profileMenuDetailsScreen,
                    extra: ProfileMenuDetailsRouteArgs(
                      section: ProfileMenuSection.account,
                      noTokenAvailable: noTokenAvailable,
                      onLogout: onLogout,
                    ),
                  );
                },
              ),
              ProfileMenuItem(
                icon: Icons.settings_outlined,
                label: 'Permissions',
                onTap: () => context.push(AppRoutes.permissionScreen),
              ),

              ProfileMenuItem(
                verticalPadding: 4,
                icon: Icons.security_outlined,
                label: 'Permission & Policy',
                onTap: () {
                  context.push<void>(
                    AppRoutes.profileMenuDetailsScreen,
                    extra: ProfileMenuDetailsRouteArgs(
                      section: ProfileMenuSection.permissionAndPolicy,
                      noTokenAvailable: noTokenAvailable,
                      onLogout: onLogout,
                    ),
                  );
                },
              ),
              const VerticalSpacing(8),
              const AppDivider(),

              ProfileMenuItem(
                icon: Icons.logout_rounded,
                label: 'Logout',
                iconColor: AppColors.appRed,
                labelColor: AppColors.appRed,
                onTap: onLogout,
              ),
            ],
          ] else ...[
            if (!noTokenAvailable && showFilmUploadCard) ...[
              const ProfileFilmUploadCard(),
              const VerticalSpacing(14),
            ],
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Manage your account',
                style: TextStyle(
                  color: AppColors.darkBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const VerticalSpacing(8),
            ProfileNavigationCard(
              icon: Icons.security_outlined,
              title: 'Permission & Policy',
              subtitle: 'Manage access and review app policies',
              onTap: () {
                context.push<void>(
                  AppRoutes.profileMenuDetailsScreen,
                  extra: ProfileMenuDetailsRouteArgs(
                    section: ProfileMenuSection.permissionAndPolicy,
                    noTokenAvailable: noTokenAvailable,
                    onLogout: onLogout,
                  ),
                );
              },
            ),
            const VerticalSpacing(8),
            ProfileNavigationCard(
              icon: Icons.manage_accounts_outlined,
              title: 'Account',
              subtitle: 'Orders, addresses, coupons and account settings',
              onTap: () {
                context.push<void>(
                  AppRoutes.profileMenuDetailsScreen,
                  extra: ProfileMenuDetailsRouteArgs(
                    section: ProfileMenuSection.account,
                    noTokenAvailable: noTokenAvailable,
                    onLogout: onLogout,
                  ),
                );
              },
            ),
          ],
          const VerticalSpacing(8),
        ],
      ),
    );
  }
}
