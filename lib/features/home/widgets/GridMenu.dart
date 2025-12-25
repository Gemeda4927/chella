
import 'package:chella/features/home/widgets/SoftMenu.dart';
import 'package:flutter/material.dart';

class GridMenu extends StatelessWidget {
  const GridMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      children: const [
        SoftMenu(icon: Icons.task, label: "Task", color: Color(0xFFFFC107)),
        SoftMenu(
          icon: Icons.swap_horiz,
          label: "Transfer",
          color: Color(0xFFFF6F61),
        ),
        SoftMenu(
          icon: Icons.account_balance_wallet,
          label: "Withdraw",
          color: Color(0xFF4D96FF),
        ),
        SoftMenu(icon: Icons.more_horiz, label: "More"),
        SoftMenu(icon: Icons.more_horiz, label: "More"),
        SoftMenu(icon: Icons.more_horiz, label: "More"),
        SoftMenu(icon: Icons.more_horiz, label: "More"),
        SoftMenu(icon: Icons.more_horiz, label: "More"),
        SoftMenu(icon: Icons.more_horiz, label: "More"),
      ],
    );
  }
}
