import 'package:flutter/material.dart';
import 'page/home_page.dart';
import 'page/login_page.dart';
import 'page/parking_page.dart';
import 'page/welcome_page.dart';
import 'theme/app_colors.dart';
import 'theme/app_theme.dart';
import 'theme/app_typography.dart';
import 'widgets/auth_background.dart';

void main() {
  runApp(const SipApp());
}

class SipApp extends StatelessWidget {
  const SipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIP',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: '/',
      routes: {
        '/': (_) => const WelcomePage(),
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
        '/map': (_) => const ParkingPage(),
        // Halaman di bawah ini belum ada di struktur project,
        // jadi sementara diarahkan ke halaman placeholder.
        '/profile': (_) => const _PlaceholderPage(title: 'Profil'),
        '/recommendation': (_) =>
            const _PlaceholderPage(title: 'Rekomendasi'),
      },
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  final String title;

  const _PlaceholderPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_rounded),
            ),
            const Spacer(),
            Center(
              child: Column(
                children: [
                  const Icon(
                    Icons.construction_rounded,
                    size: 48,
                    color: AppColors.primary,
                  ),
                  const SizedBox(height: 12),
                  Text('Halaman $title', style: AppTypography.title),
                  const SizedBox(height: 4),
                  const Text('Segera hadir.', style: AppTypography.bodyMuted),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}