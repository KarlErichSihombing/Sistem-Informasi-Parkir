import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Background halaman: putih keunguan dengan sorotan gradient halus.
/// Tidak memakai gambar, jadi ringan dan konsisten di semua halaman.
class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Sorotan kanan atas
          Positioned(
            top: -90,
            right: -70,
            child: _GlowCircle(size: 260, opacity: 0.16),
          ),
          // Sorotan kiri bawah
          Positioned(
            bottom: -110,
            left: -90,
            child: _GlowCircle(size: 280, opacity: 0.10),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}

class _GlowCircle extends StatelessWidget {
  final double size;
  final double opacity;

  const _GlowCircle({required this.size, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              AppColors.primary.withValues(alpha: opacity),
              AppColors.primary.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}