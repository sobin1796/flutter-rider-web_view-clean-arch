import 'package:flutter/cupertino.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
    this.size = 52,
    this.color = AppColors.darkGrey,
  });
  const AppLoadingWidget.small({
    super.key,
    this.size = 36,
    this.color = AppColors.primaryBlue,
  });
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.hexagonDots(color: color, size: size),
    );
  }
}

class AppLoadingWidgetWave extends StatelessWidget {
  const AppLoadingWidgetWave({
    super.key,
    this.size = 50,
    this.color = AppColors.white,
  });

  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: color,
          size: size,
        ),
      ),
    );
  }
}

class AppLoadingWidgetOrderPlace extends StatelessWidget {
  const AppLoadingWidgetOrderPlace({
    super.key,
    this.size = 50,
    this.color = AppColors.white,
  });

  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Center(
        child: LoadingAnimationWidget.flickr(
          // color: color,
          size: size,
          leftDotColor: AppColors.primaryBlue,
          rightDotColor: AppColors.primaryYellow,
        ),
      ),
    );
  }
}
