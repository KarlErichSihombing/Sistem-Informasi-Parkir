import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';
import 'app_dimensions.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,

      //Base Color
      scaffoldBackgroundColor: AppColors.grayLightest,

      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ).copyWith(
        primary: AppColors.primary,
        secondary: AppColors.complementaryYellow,
        surface: AppColors.primaryAccent,
      ),

      //Tipografi global
      textTheme: TextTheme(
        headlineLarge: AppTypography.heading1,
        headlineSmall: AppTypography.heading2,
        bodyMedium: AppTypography.body,
        bodySmall: AppTypography.caption,
        labelSmall: AppTypography.label,
      ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.grayLightest,
        foregroundColor: AppColors.grayDark,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: AppTypography.heading2.copyWith(
          color: AppColors.grayDark,
        ),
      ),
      // Card
      cardTheme: CardThemeData(
        color: AppColors.grayLightest,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radius,
          ),
        ),
      ),
       // Tombol utama
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          textStyle: AppTypography.bodyBold,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.space3,
            vertical: AppDimensions.space2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.radius,
            ),
          ),
        ),
      ),
      // Input: TextField
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.grayLightest,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.space2,
          vertical: AppDimensions.space2,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radius,
          ),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radius,
          ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppDimensions.radius,
          ),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}