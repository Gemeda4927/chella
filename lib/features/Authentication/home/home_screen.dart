import 'package:chella/core/constants/home_constants.dart';
import 'package:chella/features/Authentication/login/presentation/pages/login_page.dart';
import 'package:chella/features/Authentication/login/presentation/provider/auth_provder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        final user = authProvider.user;

        // Show a loading indicator if user data is not yet available
        if (user == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Dashboard', style: kTitleTextStyle),
                Text(
                  'Hello, ${user.fullName.split(' ').first}',
                  style: kSubTitleTextStyle,
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () => _logoutDialog(context),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.logout_rounded,
                    size: 22,
                    color: kErrorColor,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(fullName: user.fullName, username: user.username),
                const SizedBox(height: 24),
                const Text('Account Overview', style: kTitleTextStyle),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.4,
                  children: [
                    StatCard(
                      icon: Icons.account_balance_wallet_rounded,
                      iconColor: kWalletColor,
                      title: 'Wallet Balance',
                      value: '\$${user.amount}',
                      bgColor: kWalletColor.withOpacity(0.2),
                    ),
                    StatCard(
                      icon: Icons.attach_money_rounded,
                      iconColor: kEarnedColor,
                      title: 'Total Earned',
                      value: '\$${user.totalEarned}',
                      bgColor: kEarnedColor.withOpacity(0.2),
                    ),
                    StatCard(
                      icon: Icons.people_alt_rounded,
                      iconColor: kReferredColor,
                      title: 'Total Referred',
                      value: user.totalReffered.toString(),
                      bgColor: kReferredColor.withOpacity(0.2),
                    ),
                    StatCard(
                      icon: Icons.card_giftcard_rounded,
                      iconColor: kReferralColor,
                      title: 'Referral Code',
                      value: user.referralCode,
                      bgColor: kReferralColor.withOpacity(0.2),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text('Profile Details', style: kTitleTextStyle),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      DetailItem(
                        icon: Icons.person_outline_rounded,
                        label: 'Username',
                        value: user.username,
                      ),
                      DetailItem(
                        icon: Icons.code_rounded,
                        label: 'Referral Code',
                        value: user.referralCode,
                      ),
                      DetailItem(
                        icon: Icons.group_add_rounded,
                        label: 'Referred By',
                        value: (user.refferedBy.isNotEmpty)
                            ? user.refferedBy
                            : 'Not referred',
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            style: TextButton.styleFrom(foregroundColor: kErrorColor),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
