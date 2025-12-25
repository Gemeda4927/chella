import 'package:chella/core/constants/home_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChellaCard extends StatelessWidget {
  final dynamic user;
  final bool showBalance;
  final VoidCallback toggleBalance;

  const ChellaCard({
    super.key,
    required this.user,
    required this.showBalance,
    required this.toggleBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: chellaYellow,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: chellaYellow.withOpacity(0.35),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textDark,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Chella Earnings",
            style: TextStyle(fontSize: 13, color: textSoft),
          ),
          const SizedBox(height: 14),

          /// REFER
          Row(
            children: [
              const Text("Refer", style: TextStyle(fontSize: 13)),
              const SizedBox(width: 10),
              const Text("•••• ••••"),
              const SizedBox(width: 10),
              Text(
                user.referralCode,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// BALANCE
          Row(
            children: [
              Text(
                showBalance ? "${user.amount} ETB" : "**** ETB",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: toggleBalance,
                child: Icon(
                  showBalance
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20,
                ),
              ),
            ],
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "Chella",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
