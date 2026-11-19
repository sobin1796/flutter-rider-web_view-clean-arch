import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppScrollingText extends StatelessWidget {
  const AppScrollingText({required this.songTitle, super.key, this.width});

  final String songTitle;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 150,
      height: 16,
      child: Row(
        children: [
          const Icon(Icons.music_note, size: 14, color: AppColors.appYellow),
          const HorizontalSpacing(4),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final textStyle = AppTextStyles.textSmallRegular.copyWith(
                  color: AppColors.hintTextGrey,
                  fontSize: 10,
                );
                final textPainter = TextPainter(
                  text: TextSpan(text: songTitle, style: textStyle),
                  maxLines: 1,
                  textDirection: Directionality.of(context),
                  textScaler: MediaQuery.textScalerOf(context),
                )..layout();
                final textWidth = textPainter.width;
                final overflow = textWidth - constraints.maxWidth;

                return ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: OverflowBox(
                      alignment: Alignment.centerLeft,
                      minWidth: 0,
                      maxWidth: double.infinity,
                      child: SizedBox(
                        width: textWidth,
                        child:
                            Text(
                                  songTitle,
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.visible,
                                  style: textStyle,
                                )
                                .animate(
                                  onPlay: (controller) => controller.repeat(),
                                )
                                .slideX(
                                  begin: 0,
                                  end: overflow > 0 ? -overflow / textWidth : 0,
                                  duration: const Duration(seconds: 10),
                                  curve: Curves.linear,
                                ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
