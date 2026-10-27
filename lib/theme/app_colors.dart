import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF5142FF);
  static const Color primarySoft = Color(0x1F5142FF); // ungu transparan
  static const Color primaryLight = Color(0xFF8B80FF);

  // Alias lama supaya file lain yang masih memanggil ini tidak error
  static const Color primaryAccent = background;

  // Surface
  static const Color background = Color(0xFFF7F6FF);
  static const Color surface = Colors.white;

  // Teks
  static const Color ink = Color(0xFF19172E);
  static const Color muted = Color(0xFF8A87A6);
  static const Color hint = Color(0xFFBDB9E0);

  // Status
  static const Color danger = Color(0xFFE5484D);

  // Denah parkir
  static const Color slotEmpty = Color(0xFFE4E1FF);
  static const Color slotFilled = primary;

  // Bayangan
  static const Color shadow = Color(0x145142FF);
}