import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppCommentShimmer extends StatelessWidget {
  const AppCommentShimmer({super.key, this.itemCount = 3});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    const shimmerBase = Color(0xFFE9EBF0);
    const shimmerHighlight = Color(0xFFF7F8FC);

    return Shimmer.fromColors(
      baseColor: shimmerBase,
      highlightColor: shimmerHighlight,
      period: const Duration(milliseconds: 1200),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(top: 8, bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: SizedBox(
                width: 110,
                height: 16,

                child: Text(
                  'Comments',
                  style: AppTextStyles.nunitoHeading2.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 1,
              color: AppColors.borderGrey.withValues(alpha: 0.45),
            ),
            const SizedBox(height: 10),
            ...List.generate(
              itemCount,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(12, 4, 6, 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 88,
                                  height: 11,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGrey,
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 38,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightGrey,
                                    borderRadius: BorderRadius.circular(99),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: 190,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: 130,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: 100,
                              height: 10,
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                          ],
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
