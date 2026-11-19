import 'package:flutter/material.dart';
import 'package:tukaatuexpress/constants/app_colors.dart';
import 'package:tukaatuexpress/gen/fonts.gen.dart';

class AppTheme {
  static ThemeData appTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        brightness: Brightness.light,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.black,
              displayColor: AppColors.black,
              fontFamily: 'Inter',
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkGrey,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: const RoundedRectangleBorder(),
            backgroundColor: AppColors.darkGrey,
            foregroundColor: AppColors.neutralWhite,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: AppColors.neutralWhite,
            foregroundColor: AppColors.neutralWhite,
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: WidgetStatePropertyAll(AppColors.darkGrey),
          ),
        ),
        scaffoldBackgroundColor: AppColors.darkGrey,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.neutralWhite,
          foregroundColor: AppColors.neutralWhite,
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        fontFamily: FontFamily.inter,
        brightness: Brightness.dark,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: AppColors.neutralWhite,
              displayColor: AppColors.neutralWhite,
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.darkGrey,
          brightness: Brightness.dark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: const RoundedRectangleBorder(),
            backgroundColor: AppColors.darkGrey,
            foregroundColor: AppColors.neutralWhite,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: AppColors.borderGrey,
            foregroundColor: AppColors.neutralWhite,
            padding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: WidgetStatePropertyAll(AppColors.neutralWhite),
          ),
        ),
        scaffoldBackgroundColor: AppColors.neutralWhite,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.neutralWhite,
          foregroundColor: AppColors.neutralWhite,
        ),
      );
}
