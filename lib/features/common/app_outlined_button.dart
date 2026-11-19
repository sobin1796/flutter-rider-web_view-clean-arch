import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/features/common/app_loading_widget.dart';
import 'package:tukaatuexpress/utils/app_utils.dart';

class AppOutlinedButton extends StatefulWidget {
  const AppOutlinedButton({
    required this.text,
    super.key,
    this.onPressed,
    this.textColor = AppColors.white,
    this.backgroundColor = AppColors.primaryBlue,
    this.height = 52,
    this.width = double.infinity,
    this.isLoading = false,
    this.borderColor,
    this.borderRadius = 18,
    this.safePadding = false,
    this.leading,
    this.textStyle,
    this.horizontalMargin,
    this.verticalMargin,
    this.hasShadow = true,
  });

  const AppOutlinedButton.white({
    required this.text,
    super.key,
    this.onPressed,
    this.textColor = AppColors.primaryBlue,
    this.backgroundColor = AppColors.white,
    this.height = 52,
    this.width = double.infinity,
    this.isLoading = false,
    this.borderColor = AppColors.primaryBlue,
    this.borderRadius = 18,
    this.safePadding = false,
    this.leading,
    this.textStyle,
    this.horizontalMargin,
    this.verticalMargin,
    this.hasShadow = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color textColor;
  final Color backgroundColor;
  final double? height;
  final double? width;
  final bool isLoading;
  final Color? borderColor;
  final double borderRadius;
  final bool safePadding;
  final Widget? leading;
  final TextStyle? textStyle;
  final double? horizontalMargin;
  final double? verticalMargin;
  final bool hasShadow;

  @override
  State<AppOutlinedButton> createState() => _AppOutlinedButtonState();
}

class _AppOutlinedButtonState extends State<AppOutlinedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final isEnabled = widget.onPressed != null && !widget.isLoading;

    return Padding(
      padding: widget.safePadding
          ? EdgeInsets.only(bottom: 20.h)
          : EdgeInsets.zero,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: widget.horizontalMargin ?? 0,
          vertical: widget.verticalMargin ?? 0,
        ),
        child: AnimatedScale(
          duration: const Duration(milliseconds: 120),
          scale: _isPressed ? 0.97 : 1,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              onTap: isEnabled
                  ? () {
                      HapticFeedback.lightImpact();
                      AppUtils.unfocusKeyboard(context);
                      widget.onPressed?.call();
                    }
                  : null,
              onTapDown: (_) {
                setState(() => _isPressed = true);
              },
              onTapUp: (_) {
                setState(() => _isPressed = false);
              },
              onTapCancel: () {
                setState(() => _isPressed = false);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  border: Border.all(
                    color: widget.borderColor ?? Colors.transparent,
                  ),
                  boxShadow: widget.hasShadow
                      ? [
                          BoxShadow(
                            color: widget.backgroundColor.withValues(
                              alpha: 0.25,
                            ),
                            blurRadius: 18,
                            spreadRadius: 1,
                            offset: const Offset(0, 8),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: widget.isLoading
                      ? const AppLoadingWidget.small(
                          color: AppColors.backGroundGrey,
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.leading != null) ...[
                              widget.leading!,
                              const SizedBox(width: 8),
                            ],
                            Text(
                              widget.text,
                              style:
                                  widget.textStyle ??
                                  TextStyle(
                                    color: widget.textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.2,
                                  ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
