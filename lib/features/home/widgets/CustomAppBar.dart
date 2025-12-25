import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Image.asset("assets/images/chella_logo.png", height: 32),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
