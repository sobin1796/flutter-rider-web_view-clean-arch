import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_shimmer_container.dart';

class AppCachedImage extends StatelessWidget {
  const AppCachedImage({
    required this.imgUrl,
    super.key,
    this.height,
    this.width,
    this.fit,
    this.shimmer,
    this.defaultIcon,
    this.title,
    this.memCacheWidth,
    this.memCacheHeight,
  });

  final String imgUrl;
  final double? height;
  final String? title;
  final double? width;
  final BoxFit? fit;
  final Widget? shimmer;
  final Widget? defaultIcon;
  final int? memCacheWidth;
  final int? memCacheHeight;
  @override
  Widget build(BuildContext context) {
    final url = imgUrl.trim();
    final isLocalFile =
        url.isNotEmpty &&
        !url.startsWith('http://') &&
        !url.startsWith('https://');
    if (isLocalFile) {
      return Image.file(File(url), height: height, width: width, fit: fit);
    }
    if (url.isEmpty) {
      return Container(
        height: height,
        width: width,
        color: AppColors.borderGrey.withValues(alpha: 0.35),
        child: Center(
          child: title != null && title!.isNotEmpty
              ? Text(
                  title != null && title!.isNotEmpty
                      ? '${title![0].toUpperCase()}${title!.substring(1)}'
                      : '',
                )
              : defaultIcon ??
                    Icon(Icons.image, color: AppColors.gray.withAlpha(80)),
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      memCacheWidth: memCacheWidth,
      memCacheHeight: memCacheHeight,
      progressIndicatorBuilder: (context, url, progress) =>
          shimmer ?? const AppShimmerContainer(),
      errorWidget: (context, url, error) {
        return Center(
          child: Icon(Icons.image, color: AppColors.gray.withAlpha(80)),
        );
      },
    );
  }
}
