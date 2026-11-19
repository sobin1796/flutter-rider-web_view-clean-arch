import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_scaffold.dart';
import 'package:tukaatuexpress/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:tukaatuexpress/features/profile/presentation/bloc/profile_state.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/widget/user_profile_screen_widgets/profile_menu_card.dart';
import 'package:tukaatuexpress/features/profile/presentation/screens/widget/user_profile_screen_widgets/profile_top_section.dart';
import 'package:tukaatuexpress/utils/auth_utills.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool noTokenAvailable = true;
  int _authCheckGeneration = 0;

  @override
  void initState() {
    super.initState();
    AuthUtils.authChange.addListener(_loadLoginStatus);
    _loadLoginStatus();
  }

  Future<void> _loadLoginStatus() async {
    final generation = ++_authCheckGeneration;
    final isLoggedIn = await AuthUtils.isLoggedIn();
    if (!mounted || generation != _authCheckGeneration) return;
    setState(() => noTokenAvailable = !isLoggedIn);
  }

  @override
  void dispose() {
    AuthUtils.authChange.removeListener(_loadLoginStatus);
    super.dispose();
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {},
            child: const Text(
              'Logout',
              style: TextStyle(color: AppColors.appRed),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.isLogout == true) {
          setState(() => noTokenAvailable = true);
          context.read<ProfileCubit>().resetLogout();
        }
      },
      builder: (context, state) {
        return AppScaffold(
          appBar: AppBar(toolbarHeight: 1),
          backgroundColor: AppColors.primaryBlue.withAlpha(15),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ProfileTopSection(
                  state: state,
                  noTokenAvailable: noTokenAvailable,
                  fullName: '',
                ),
                ProfileMenuCard(
                  noTokenAvailable: noTokenAvailable,
                  onLogout: () => _showLogoutDialog(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
