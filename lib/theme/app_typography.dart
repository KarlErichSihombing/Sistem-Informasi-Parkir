import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  AppTypography._();

  static const TextStyle display = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    height: 1.2,
    letterSpacing: -0.5,
    color: AppColors.ink,
  );

  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    color: AppColors.ink,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w800,
    color: AppColors.ink,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColors.ink,
  );

  static const TextStyle bodyMuted = TextStyle(
    fontSize: 14,
    height: 1.5,
    color: AppColors.muted,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    height: 1.3,
    color: AppColors.muted,
  );

  static const TextStyle label = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
  );

  static const TextStyle button = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}