import 'package:flutter/material.dart';

void main() {
  runApp(Chella());
}

class Chella extends StatelessWidget {
  const Chella({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homescreen());
  }
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chella")),
      body: Center(child: Text("Hello from chella")),
    );
  }
}
