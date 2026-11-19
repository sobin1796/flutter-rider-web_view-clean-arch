import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/utils/app_navigator.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.color,
    this.onTap,
    this.hideLeading = false,
    this.scrolledUnderElevation,
    this.actions,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: AppColors.black,
    ),
    this.backgroundColor = AppColors.white,
    this.systemOverlayStyle,
    this.centerTitle = true,
    this.padding = 0,
    this.image,
  });
  final String? title;
  final Color? color;
  final Color backgroundColor;
  final void Function()? onTap;
  final double? scrolledUnderElevation;
  final List<Widget>? actions;
  final TextStyle textStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool hideLeading;
  final bool? centerTitle;
  final double? padding;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: systemOverlayStyle,
      foregroundColor: color,
      backgroundColor: backgroundColor,
      scrolledUnderElevation: scrolledUnderElevation,
      automaticallyImplyLeading: false,
      leading: hideLeading
          ? null
          : InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(90),
              ),
              onTap: () {
                if (onTap != null) {
                  onTap?.call();
                } else {
                  AppNavigator.pop(context);
                }
              },
              child: Align(
                child:
                    image ??
                    const Icon(
                      Icons.arrow_back_ios,
                      size: 22,
                      color: AppColors.black,
                    ),
              ),
            ),
      title: title != null
          ? Padding(
              padding: EdgeInsets.only(left: padding!),
              child: Text(title!, style: textStyle),
            )
          : null,
      titleSpacing: 0,
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
