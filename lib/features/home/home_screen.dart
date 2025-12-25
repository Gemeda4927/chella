import 'package:chella/core/constants/home_colors.dart';
import 'package:chella/features/Authentication/login/presentation/provider/auth_provder.dart';
import 'package:chella/features/home/widgets/ChellaCard.dart';
import 'package:chella/features/home/widgets/CustomAppBar.dart';
import 'package:chella/features/home/widgets/CustomBottomNavBar.dart';
import 'package:chella/features/home/widgets/GridMenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  bool _showBalance = false;

  void _toggleBalance() {
    setState(() => _showBalance = !_showBalance);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (authProvider.user == null) {
          return const Scaffold(body: Center(child: Text("User not loaded")));
        }

        final user = authProvider.user!;

        return Scaffold(
          backgroundColor: chellaBg,
          appBar: const CustomAppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ChellaCard(
                  user: user,
                  showBalance: _showBalance,
                  toggleBalance: _toggleBalance,
                ),
                const SizedBox(height: 26),
                const GridMenu(),
              ],
            ),
          ),
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: _selectedIndex,
            onIndexChanged: (index) => setState(() => _selectedIndex = index),
          ),
        );
      },
    );
  }
}
