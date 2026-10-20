
import 'package:flutter/material.dart';

import 'page/welcome_page.dart';
import 'page/login_page.dart';
import 'page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UB Parkir',
      debugShowCheckedModeBanner: false,

      // Halaman pertama yang ditampilkan
      initialRoute: '/',

      // Daftar halaman aplikasi
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
