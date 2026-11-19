import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/constants/app_lottie_animation.dart';
import 'package:tukaatuexpress/features/common/app_animation_lottie.dart';

class LoginIllustration extends StatelessWidget {
  const LoginIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        color: AppColors.lightBlue,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: const AppAnimationLottie(
        url: AppLottieAnimations.delivery,
        size: 136,
      ),
    );
  }
}
