import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';
import 'package:tukaatuexpress/features/common/app_divider.dart';
import 'package:tukaatuexpress/features/common/app_scaffold.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/common/app_web_view.dart';
import 'package:tukaatuexpress/features/common/custom_app_bar.dart';
import 'package:tukaatuexpress/features/profile/presentation/model/profile_menu_details_route_args.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/widget/user_profile_screen_widgets/profile_menu_item.dart';
import 'package:tukaatuexpress/utils/auth_guard.dart';

class ProfileMenuDetailsScreen extends StatelessWidget {
  const ProfileMenuDetailsScreen({required this.args, super.key});
  final ProfileMenuDetailsRouteArgs args;
  String get _title => switch (args.section) {
    ProfileMenuSection.permissionAndPolicy => 'Permission & Policy',
    ProfileMenuSection.account => 'Account',
  };

  String get _description => switch (args.section) {
    ProfileMenuSection.permissionAndPolicy =>
      'Manage app access and learn about our policies.',
    ProfileMenuSection.account => 'Manage your account and activity.',
  };

  List<Widget> _menuItems(BuildContext context) {
    if (args.section == ProfileMenuSection.permissionAndPolicy) {
      return [
        ProfileMenuItem(
          icon: Icons.description_outlined,
          label: 'Terms of Use',
          onTap: () => context.push(
            AppRoutes.appWebView,
            extra: AppWebViewParam(
              url: 'https://tukaatu.com/terms-of-use',
              title: 'Terms of Use',
            ),
          ),
        ),
        ProfileMenuItem(
          icon: Icons.gpp_good_outlined,
          label: 'Community Safety Policy',
          onTap: () => context.push(
            AppRoutes.appWebView,
            extra: AppWebViewParam(
              url: 'https://tukaatu.com/chat-policy',
              title: 'Community Safety Policy',
            ),
          ),
        ),
        ProfileMenuItem(
          icon: Icons.privacy_tip_outlined,
          label: 'Privacy Policy',
          onTap: () => context.push(
            AppRoutes.appWebView,
            extra: AppWebViewParam(
              url: 'https://tukaatu.com/tukaatu-search-policy',
              title: 'Privacy & Policy',
            ),
          ),
        ),
      ];
    }

    return [
      ProfileMenuItem(
        icon: Icons.delete_outline,
        label: 'Delete Account',
        onTap: () async {
          if (!await AuthGuard.checkLogin(context)) return;
          if (!context.mounted) return;
          context.push(AppRoutes.deleteAccountScreen);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = _menuItems(context);
    return AppScaffold(
      backgroundColor: AppColors.neutralBackground,
      appBar: CustomAppBar(title: _title, scrolledUnderElevation: 0),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        children: [
          Text(
            _description,
            style: const TextStyle(color: AppColors.neutralGray, fontSize: 13),
          ),
          const VerticalSpacing(14),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.borderGrey),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                for (var index = 0; index < items.length; index++) ...[
                  items[index],
                  if (index < items.length - 1) const AppDivider(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
