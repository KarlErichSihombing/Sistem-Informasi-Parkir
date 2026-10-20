
import 'package:flutter/material.dart';
import '../widgets/auth_background.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 65),

                      // Judul welcome
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w800,
                            height: 1.15,
                            color: Color(0xFF19172E),
                          ),
                          children: const [
                            TextSpan(text: 'Selamat Datang\n'),
                            TextSpan(text: 'di '),
                            TextSpan(
                              text: 'Aplikasi SIP',
                              style: TextStyle(
                                color: Color(0xFF5142FF),
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 42),

                      // Tombol Login
                      _WelcomeButton(
                        text: 'Login / Sign In',
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                      ),

                      const SizedBox(height: 16),

                      // Tombol Sign Up
                      _WelcomeButton(
                        text: 'Sign Up',
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                      ),

                      const SizedBox(height: 100),

                      // Tombol Guest Mode
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        icon: const Icon(
                          Icons.account_circle_outlined,
                          size: 17,
                        ),
                        label: const Text('Guest mode'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF5142FF),
                          backgroundColor: const Color(0xFFF0F0F0),
                          side: const BorderSide(
                            color: Color(0xFF5142FF),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          minimumSize: Size.zero,
                          tapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shape: const StadiumBorder(),
                        ),
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _WelcomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _WelcomeButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 38,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF392BFF),
          backgroundColor: const Color(0xFFF0F0F0),
          side: const BorderSide(
            color: Color(0xFF5142FF),
            width: 1.2,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
