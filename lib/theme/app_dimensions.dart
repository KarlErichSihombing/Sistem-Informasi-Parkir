import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppDimensions {
  AppDimensions._();

  // Spacing
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 28;
  static const double huge = 40;

  static const double pagePadding = 20;

  // Radius
  static const double radiusSm = 10;
  static const double radiusMd = 14;
  static const double radiusLg = 18;
  static const double radiusXl = 24;

  // Tinggi komponen
  static const double buttonHeight = 54;

  // Bayangan lembut untuk kartu
  static const List<BoxShadow> softShadow = [
    BoxShadow(
      color: AppColors.shadow,
      blurRadius: 18,
      offset: Offset(0, 6),
    ),
  ];
}