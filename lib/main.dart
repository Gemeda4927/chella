import 'package:chella/features/Authentication/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:chella/core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chella',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}