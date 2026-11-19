import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerContainer extends StatelessWidget {
  const AppShimmerContainer({super.key, this.height});
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.grey,
        height: height ?? 343,
      ),
    );
  }
}
