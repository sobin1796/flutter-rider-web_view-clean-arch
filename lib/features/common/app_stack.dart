import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_spacing.dart';
import 'package:tukaatuexpress/features/common/app_text_form_field.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';
import 'package:tukaatuexpress/utils/app_utils.dart';

class AppStack extends StatelessWidget {
  const AppStack({
    required this.bottomChildren,
    this.isSearch = false,
    this.topContainerHeight,
    super.key,
    this.subTitle,
    this.title,
    this.isBack = false,
    this.topWidget,
    this.trailingIcon,
    this.bottomContainerHeight = 220,
  });
  final String? title;
  final String? subTitle;
  final Widget? trailingIcon;
  final Widget? topWidget;
  final double? topContainerHeight;
  final num? bottomContainerHeight;
  final List<Widget> bottomChildren;
  final bool isBack;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          height:
              MediaQuery.sizeOf(context).height - (topContainerHeight ?? 615.h),
          // topContainerHeight ?? 250.h,
          color: AppColors.primaryBlue,
          child: topWidget.isNotNull
              ? topWidget
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpacing(32.h),
                    Row(
                      children: [
                        Text(
                          title ?? '',
                          style: AppTextStyles.headingH1,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        if (trailingIcon.isNotNull)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: trailingIcon,
                          ),
                      ],
                    ),
                    if (subTitle != null)
                      Text(
                        subTitle!,
                        style: AppTextStyles.titleSm.copyWith(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    if (isSearch) ...[
                      const VerticalSpacing(12),
                      const AppTextFormField(
                        hintText:
                            "Search chapters, keywords(e.g. 'Constitution')",
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(Icons.search, color: AppColors.gray),
                        ),
                      ),
                    ],
                  ],
                ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            height: MediaQuery.sizeOf(context).height - bottomContainerHeight!,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: bottomChildren,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
