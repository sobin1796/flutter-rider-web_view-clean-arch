import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';
import 'package:tukaatuexpress/features/common/app_container.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/login/presentation/screens/widget/login_header.dart';
import 'package:tukaatuexpress/features/login/presentation/screens/widget/login_illustration.dart';
import 'package:tukaatuexpress/features/login/presentation/screens/widget/login_options_row.dart';
import 'package:tukaatuexpress/features/login/presentation/screens/widget/login_password_field.dart';
import 'package:tukaatuexpress/features/login/presentation/screens/widget/login_phone_field.dart';
import 'package:tukaatuexpress/features/login/presentation/screens/widget/login_submit_button.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';
import 'package:tukaatuexpress/utils/uihelper.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: formKey,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const VerticalSpacing(80),
                    const Center(child: LoginIllustration()),
                    const VerticalSpacing(8),
                    const LoginHeader(),
                    const VerticalSpacing(32),
                    LoginPhoneField(controller: phoneController),
                    const VerticalSpacing(16),
                    LoginPasswordField(controller: passwordController),
                    const VerticalSpacing(12),
                    LoginOptionsRow(
                      onRememberMeChanged: (value) {},
                      onForgotPassword: () {},
                    ),
                    const VerticalSpacing(16),
                    LoginSubmitButton(
                      onPressed: () async {
                        UiHelper.showLoaderDialog(context);

                        await Future.delayed(const Duration(seconds: 1));
                        if (context.mounted) {
                          context
                            ..pop(context)
                            ..go(AppRoutes.homeScreen);
                        }
                      },
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'OR',
                        style: AppTextStyles.captionRegular.copyWith(
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                    AppContainer(
                      borderRadius: 16,
                      verticalPadding: 12,
                      onTap: () {},
                      color: AppColors.appRed,
                      child: Text(
                        'Login with Email',
                        style: AppTextStyles.textMediumRegular.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
