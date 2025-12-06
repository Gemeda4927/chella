import 'package:chella/features/Authentication/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Chella());
}

class Chella extends StatelessWidget {
  const Chella({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Loginpage(),
    );
  }
}
