import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_scaffold.dart';
import 'package:tukaatuexpress/features/login/presentation/screens/widget/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      backgroundColor: AppColors.neutralBackground,
      body: SafeArea(child: LoginForm()),
    );
  }
}
