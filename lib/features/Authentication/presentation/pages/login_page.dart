import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello from login screen",
          style: TextStyle(fontSize: 42, color: Colors.red),
        ),
      ),
    );
  }
}
