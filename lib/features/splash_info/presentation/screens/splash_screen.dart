import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/constants/app_lottie_animation.dart';
import 'package:tukaatuexpress/core/routes/app_routes.dart';
import 'package:tukaatuexpress/features/common/app_animation_lottie.dart';
import 'package:tukaatuexpress/features/common/app_scaffold.dart';
import 'package:tukaatuexpress/gen/assets.gen.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showBranding = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_navigateToMain());
    });
  }

  Future<void> _navigateToMain() async {
    await Future<void>.delayed(const Duration(milliseconds: 3500));
    if (!mounted) return;
    context.go(AppRoutes.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF0F8FC), Color(0xFFFCFDFE), Color(0xFFFFFCF3)],
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -90,
              right: -70,
              child: Container(
                width: 230,
                height: 230,
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlueLight,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -110,
              left: -70,
              child: Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  color: AppColors.appYellowLight,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: _showBranding
                    ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Assets.images.tukaatuMainLogo.image(
                                width: 180,
                                height: 40,
                              ),
                              Text(
                                'EXPRESS',
                                style: AppTextStyles.textSmallSemiBold.copyWith(
                                  color: AppColors.primaryBlue,
                                  letterSpacing: 3,
                                ),
                              ),
                            ],
                          )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 500))
                          .slideY(
                            begin: 0.12,
                            end: 0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeOut,
                          )
                    : const AppAnimationLottie(
                            url: AppLottieAnimations.delivery,
                            size: 190,
                          )
                          .animate(
                            onComplete: (_) {
                              if (!mounted) return;
                              setState(() => _showBranding = true);
                            },
                          )
                          .moveX(
                            begin: -90,
                            end: 300,
                            duration: const Duration(milliseconds: 2200),
                            curve: Curves.easeInOut,
                          )
                          .then()
                          .fadeOut(duration: const Duration(milliseconds: 300)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
