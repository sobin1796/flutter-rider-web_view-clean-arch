import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppTextFormFieldWithoutLabel extends StatelessWidget {
  const AppTextFormFieldWithoutLabel({
    super.key,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.decoration,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.onTap,
    this.isReadOnly = false,
    this.scroll = EdgeInsets.zero,
    this.autofocus = false,
    this.maxLines = 1,
    this.labelText,
    this.fillColor = AppColors.neutralWhite,
    this.borderWidth = 1.0,
    this.hintStyle,
    this.autofillHints,
    this.focusedBorderColor = AppColors.neutralWhite,
    this.style,
    this.cursorHeight,
    this.maxLength,
    this.alignLabelWithHint = false,
    this.showCounter = true,
    this.inputFormatters,
  });

  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final InputDecoration? decoration;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool isReadOnly;
  final void Function()? onTap;
  final EdgeInsets scroll;
  final AutovalidateMode autovalidateMode;
  final TextInputAction textInputAction;
  final BorderRadius borderRadius;
  final bool autofocus;
  final int? maxLines;
  final String? labelText;
  final Color fillColor;
  final Color focusedBorderColor;
  final double borderWidth;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Iterable<String>? autofillHints;
  final double? cursorHeight;
  final int? maxLength;
  final bool alignLabelWithHint;
  final bool showCounter;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      scrollPadding: scroll,
      readOnly: isReadOnly,
      onTap: () {
        onTap?.call();
      },
      obscureText: obscureText,
      validator: validator,
      keyboardType: textInputType,
      controller: controller,
      inputFormatters: inputFormatters,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      cursorHeight: cursorHeight,
      style: style,
      maxLength: maxLength,
      buildCounter: maxLength == null || !showCounter
          ? null
          : (
              context, {
              required currentLength,
              required isFocused,
              required maxLength,
            }) {
              return Text(
                '$currentLength/$maxLength',
                style: TextStyle(color: AppColors.black, fontSize: 12.sp),
              );
            },
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: fillColor,
        hintText: hintText,
        alignLabelWithHint: alignLabelWithHint,
        hintStyle: hintStyle ??
            AppTextStyles.textMediumRegular
                .copyWith(color: AppColors.neutralWhite),
        labelStyle: AppTextStyles.textMediumRegular
            .copyWith(color: AppColors.neutralWhite),
        contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: AppColors.gray, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            color: AppColors.appRed,
          ),
        ),
        errorStyle: const TextStyle(
          color: AppColors.appRed,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: const BorderSide(
            width: 2,
            color: AppColors.appRed,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 36,
          minWidth: 40,
        ),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 36,
          minWidth: 40,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon == null
            ? null
            : Focus(
                canRequestFocus: false,
                descendantsAreFocusable: false,
                child: suffixIcon!,
              ),
      ),
    );
  }
}
