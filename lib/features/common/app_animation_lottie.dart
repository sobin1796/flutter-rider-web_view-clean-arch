import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tukaatuexpress/utils/dot_lottie_decoder.dart';

class AppAnimationLottie extends StatelessWidget {
  const AppAnimationLottie({
    required this.url,
    super.key,
    this.size = 50,
    this.fit = BoxFit.contain,
    this.repeat = true,
    this.reverse = false,
  });

  final String url;
  final double size;
  final BoxFit fit;
  final bool repeat;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Lottie.asset(
        url,
        decoder: url.endsWith('.lottie') ? decodeDotLottie : null,
        fit: fit,
        repeat: repeat,
        reverse: reverse,
      ),
    );
  }
}
