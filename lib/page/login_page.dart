
import 'package:flutter/material.dart';
import '../widgets/auth_background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  bool hidePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 42),

                      // Judul halaman
                      Center(
                        child: Text.rich(
                          TextSpan(
                            style: const TextStyle(
                              fontSize: 29,
                              fontWeight: FontWeight.w800,
                              height: 1.15,
                              color: Color(0xFF19172E),
                            ),
                            children: const [
                              TextSpan(text: 'Masuk dengan\n'),
                              TextSpan(
                                text: 'akunmu',
                                style: TextStyle(
                                  color: Color(0xFF5142FF),
                                ),
                              ),
                              TextSpan(text: '!'),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: 26),

                      // Label username
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'Name/Username',
                          style: TextStyle(
                            color: Color(0xFF5142FF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Input username
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: 'NIM135792',
                          hintStyle: const TextStyle(
                            color: Color(0xFFAAA6FF),
                            fontSize: 12,
                          ),
                          prefixIcon: const Icon(
                            Icons.account_circle_outlined,
                            color: Color(0xFF5142FF),
                            size: 19,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF0F0F0),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 26),

                      // Label password
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            color: Color(0xFF5142FF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Input password
                      TextField(
                        controller: passwordController,
                        obscureText: hidePassword,
                        decoration: InputDecoration(
                          hintText: '123Password',
                          hintStyle: const TextStyle(
                            color: Color(0xFFAAA6FF),
                            fontSize: 12,
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Color(0xFF5142FF),
                            size: 19,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              size: 18,
                              color: const Color(0xFF5142FF),
                            ),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFF0F0F0),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Tombol Login
                      SizedBox(
                        width: double.infinity,
                        height: 36,
                        child: OutlinedButton(
                          
                          onPressed: () {
                            if (usernameController.text.trim().isEmpty ||
                                passwordController.text.isEmpty) {
                              showMessage(
                                'Masukkan username dan password terlebih dahulu.',
                              );
                              return;
                            }

                            Navigator.pushReplacementNamed(context, '/home');
                          },

                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFFF0F0F0),
                            foregroundColor: const Color(0xFF392BFF),
                            side: const BorderSide(
                              color: Color(0xFF5142FF),
                              width: 1.3,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Login alternatif
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          'Or sign in with:',
                          style: TextStyle(
                            color: Color(0xFF5142FF),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          Expanded(
                            child: _SocialButton(
                              icon: Icons.g_mobiledata,
                              text: 'Google',
                              onPressed: () {
                                showMessage(
                                  'Login Google belum dihubungkan.',
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: _SocialButton(
                              icon: Icons.code,
                              text: 'GitHub',
                              onPressed: () {
                                showMessage(
                                  'Login GitHub belum dihubungkan.',
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 105),

                      // Lupa password
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            const Text(
                              'Forgot password? ',
                              style: TextStyle(
                                color: Color(0xFF19172E),
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showMessage(
                                  'Fitur reset password belum dibuat.',
                                );
                              },
                              child: const Text(
                                'Click here',
                                style: TextStyle(
                                  color: Color(0xFF5142FF),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
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

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFFF0F0F0),
          foregroundColor: const Color(0xFF392BFF),
          side: const BorderSide(
            color: Color(0xFF5142FF),
            width: 1.1,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 19),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
