import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_shimmer.dart';

class AppGridShimmer extends StatelessWidget {
  const AppGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 233.h,
      ),
      itemBuilder: (context, index) => const AppGridShimmerCard(),
    );
  }
}

class AppGridShimmerCard extends StatelessWidget {
  const AppGridShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 200,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.white),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.09),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AppShimmer(
          highlightColor: Colors.grey.shade200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AspectRatio(aspectRatio: 1, child: _block()),
              const SizedBox(height: 10),
              _block(height: 17, width: double.infinity),
              const SizedBox(height: 6),
              Row(
                children: [
                  Flexible(child: _block(height: 13, width: 65)),
                  const SizedBox(width: 6),
                  Flexible(child: _block(height: 10, width: 40)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _block({double? height, double? width}) {
    return Container(height: height, width: width, color: Colors.grey);
  }
}
