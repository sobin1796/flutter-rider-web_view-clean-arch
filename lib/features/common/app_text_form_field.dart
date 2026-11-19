import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/utils/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    this.inputFormatters,
    super.key,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.decoration,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.textInputAction = TextInputAction.next,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.onTap,
    this.textCapitalization = TextCapitalization.none,
    this.isReadOnly = false,
    this.scroll = EdgeInsets.zero,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.labelText,
    this.fillColor = AppColors.white,
    this.borderWidth = 2.0,
    this.hintStyle,
    this.autofillHints,
    this.focusedBorderColor,
    this.style,
    this.cursorHeight,
    this.maxLength,
    this.alignLabelWithHint = false,
    this.onChanged,
    this.borderSide = const BorderSide(color: AppColors.appRed),
    this.enabledBorderSide = const BorderSide(
      width: 1.2,
      color: AppColors.borderGrey,
    ),
    this.focusNode,
    this.contentPadding = const EdgeInsets.fromLTRB(12, 6, 12, 6),
  });
  final EdgeInsetsGeometry contentPadding;
  final FocusNode? focusNode;
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
  final int? minLines;
  final String? labelText;
  final BorderSide borderSide;
  final BorderSide enabledBorderSide;

  final Color fillColor;
  final Color? focusedBorderColor;
  final double borderWidth;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Iterable<String>? autofillHints;
  final double? cursorHeight;
  final int? maxLength;
  final bool alignLabelWithHint;
  final TextCapitalization textCapitalization;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,

      textCapitalization: textCapitalization,
      focusNode: focusNode,
      maxLines: maxLines,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      scrollPadding: scroll,
      readOnly: isReadOnly,
      onTap: () {
        onTap?.call();
      },
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validator,
      minLines: minLines,
      keyboardType: textInputType,
      controller: controller,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      cursorHeight: cursorHeight,
      style:
          style ??
          AppTextStyles.titleSm.copyWith(
            color: AppColors.black,
          ), // text style is here
      buildCounter: maxLength == null
          ? null
          : (
              context, {
              required currentLength,
              required isFocused,
              required maxLength,
            }) {
              return Text(
                '$currentLength/$maxLength words',
                style: const TextStyle(
                  color: AppColors.neutralWhite,
                  fontSize: 16,
                ),
              );
            },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelText: labelText,
        labelStyle: AppTextStyles.textMediumRegular.copyWith(
          color: AppColors.gray,
        ),
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        alignLabelWithHint: alignLabelWithHint,
        hintStyle:
            hintStyle ??
            AppTextStyles.textMediumRegular.copyWith(color: AppColors.gray),
        contentPadding: contentPadding,
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: enabledBorderSide,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: borderWidth,
            color: focusedBorderColor ?? AppColors.primaryBlue,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: borderSide,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: borderSide,
        ),
        errorStyle: const TextStyle(
          color: AppColors.appRed,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
        suffixIconConstraints: const BoxConstraints(
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
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 24,
          minWidth: 24,
        ),
      ),
    );
  }
}
