import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_typography.dart';
import '../widgets/auth_background.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppDimensions.pagePadding,
          AppDimensions.lg,
          AppDimensions.pagePadding,
          AppDimensions.xxl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            Image.asset(
              'assets/images/LOGO SIP.png',
              width: 120,
              height: 52,
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
              errorBuilder: (_, __, ___) => const Text(
                'SIP',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primary,
                ),
              ),
            ),

            const Spacer(),

            // Ilustrasi sederhana
            Center(
              child: Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(48),
                  boxShadow: AppDimensions.softShadow,
                ),
                child: Center(
                  child: Container(
                    width: 112,
                    height: 112,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryLight],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Icon(
                      Icons.local_parking_rounded,
                      color: Colors.white,
                      size: 64,
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Teks
            Text.rich(
              TextSpan(
                style: AppTypography.display.copyWith(fontSize: 32),
                children: const [
                  TextSpan(text: 'Cari '),
                  TextSpan(
                    text: 'parkir',
                    style: TextStyle(color: AppColors.primary),
                  ),
                  TextSpan(text: ' di UB\njadi lebih mudah.'),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.md),
            const Text(
              'Lihat denah dan ketersediaan slot parkir di area kampus secara langsung.',
              style: AppTypography.bodyMuted,
            ),

            const SizedBox(height: AppDimensions.xxl),

            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text('Mulai'),
            ),
          ],
        ),
      ),
    );
  }
}