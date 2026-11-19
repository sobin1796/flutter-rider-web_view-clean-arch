import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/constants/app_lottie_animation.dart';
import 'package:tukaatuexpress/utils/dot_lottie_decoder.dart';

class AppSwipeAnimation extends StatelessWidget {
  const AppSwipeAnimation({super.key, this.size = 120});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppLottieAnimations.swipeLeft,
      decoder: decodeDotLottie,
      fit: BoxFit.contain,
      repeat: true,
      height: size,
      delegates: LottieDelegates(
        values: [
          ValueDelegate.color(const ['**'], value: AppColors.primaryBlue),
        ],
      ),
    );
  }
}
