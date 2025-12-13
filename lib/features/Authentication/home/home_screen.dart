import 'package:flutter/material.dart';
import 'package:chella/core/constants/auth_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: kPrimaryYellow,
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Under Development',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
 