import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';

class AppTextStyles {
  // Private constructor
  const AppTextStyles._();
  static const TextStyle textMediumRegular = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontSize: 14,
  );
  static const TextStyle captionLight = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.white,
    fontSize: 10,
  );
  static const TextStyle textLargeMedium = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 20,
  );
  static const TextStyle headingH2 = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontSize: 20,
  );
  static const TextStyle headingH1 = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontSize: 24,
  );
  static const TextStyle captionSemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue,
    fontSize: 10,
  );
  static const TextStyle small30012 = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.neutralGray,
    fontSize: 12,
  );
  static const TextStyle textSmallLight = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.neutralGray,
    fontSize: 12,
  );
  static const TextStyle captionRegular = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.neutralGray,
    fontSize: 10,
  );
  static const TextStyle textMediumBold = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: 14,
  );
  static const TextStyle textMediumLight = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.gray,
    fontSize: 14,
  );
  static const TextStyle textMediumMedium = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 14,
  );
  static const TextStyle nunitoHeadingSmall = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontSize: 12,
  );
  static const TextStyle nunitoHeading1 = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: 16,
  );
  static const TextStyle nunitoHeading2 = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontSize: 14,
  );
  static const TextStyle nunitoHeading3 = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontSize: 12,
  );

  //Other Text  Styles
  static const TextStyle titleHd = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: 24,
  );
  static const TextStyle titleSm = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.white,
    fontSize: 14,
  );
  static const TextStyle titleSmRegular = TextStyle(
    fontWeight: FontWeight.w300,
    color: Color(0xFF363636),
    fontSize: 13,
  );
  static const TextStyle titleMd = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontSize: 20,
  );

  static const TextStyle textSmallRegular = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.colors6C757D,
    fontSize: 12,
  );
  static const TextStyle textSmallSemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.colors6C757D,
    fontSize: 11,
  );
  static const TextStyle textBaseRegular = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontSize: 16,
  );
  static const TextStyle textBaseSemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.primaryBlue,
    fontSize: 16,
  );
  static const TextStyle textBaseLight = TextStyle(
    fontWeight: FontWeight.w300,
    color: AppColors.black,
    fontSize: 16,
  );
  static const TextStyle textMediumSemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.black,
    fontSize: 14,
  );
  static const TextStyle textLargeSemiBold = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColors.neutralWhite,
    fontSize: 20,
  );
  static const TextStyle textLargeBold = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.black,
    fontSize: 20,
  );
  static TextStyle custom({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
  }) {
    return TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }
}
