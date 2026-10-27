import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_typography.dart';
import '../widgets/auth_background.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    // TODO: sambungkan ke proses autentikasi
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          AppDimensions.pagePadding,
          AppDimensions.md,
          AppDimensions.pagePadding,
          AppDimensions.xxl,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Tombol kembali
              InkWell(
                onTap: () => Navigator.maybePop(context),
                customBorder: const CircleBorder(),
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    shape: BoxShape.circle,
                    boxShadow: AppDimensions.softShadow,
                  ),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 20,
                    color: AppColors.ink,
                  ),
                ),
              ),

              const SizedBox(height: AppDimensions.huge),

              Text.rich(
                TextSpan(
                  style: AppTypography.display.copyWith(fontSize: 32),
                  children: const [
                    TextSpan(text: 'Selamat datang\n'),
                    TextSpan(
                      text: 'kembali',
                      style: TextStyle(color: AppColors.primary),
                    ),
                    TextSpan(text: ' 👋'),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.sm),
              const Text(
                'Masuk untuk mulai mencari area parkir.',
                style: AppTypography.bodyMuted,
              ),

              const SizedBox(height: AppDimensions.huge),

              // NIM / Email
              const Text('NIM atau email', style: AppTypography.label),
              const SizedBox(height: AppDimensions.sm),
              _ShadowField(
                child: TextFormField(
                  controller: _idController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Masukkan NIM atau email',
                    prefixIcon: Icon(
                      Icons.person_outline_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'NIM atau email wajib diisi'
                      : null,
                ),
              ),

              const SizedBox(height: AppDimensions.lg),

              // Password
              const Text('Kata sandi', style: AppTypography.label),
              const SizedBox(height: AppDimensions.sm),
              _ShadowField(
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _obscure,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submit(),
                  decoration: InputDecoration(
                    hintText: 'Masukkan kata sandi',
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.primary,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => setState(() => _obscure = !_obscure),
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColors.muted,
                        size: 20,
                      ),
                    ),
                  ),
                  validator: (v) => (v == null || v.length < 6)
                      ? 'Minimal 6 karakter'
                      : null,
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Fitur lupa kata sandi belum tersedia'),
                      ),
                    );
                  },
                  child: const Text('Lupa kata sandi?'),
                ),
              ),

              const SizedBox(height: AppDimensions.md),

              ElevatedButton(
                onPressed: _submit,
                child: const Text('Masuk'),
              ),

              const SizedBox(height: AppDimensions.xl),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Belum punya akun?', style: AppTypography.caption),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Halaman daftar belum tersedia'),
                        ),
                      );
                    },
                    child: const Text('Daftar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Membungkus field dengan bayangan halus.
class _ShadowField extends StatelessWidget {
  final Widget child;

  const _ShadowField({required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        boxShadow: AppDimensions.softShadow,
      ),
      child: child,
    );
  }
}