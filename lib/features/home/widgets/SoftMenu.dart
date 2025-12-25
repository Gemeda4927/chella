import 'package:chella/core/constants/home_colors.dart';
import 'package:flutter/material.dart';

class SoftMenu extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const SoftMenu({
    super.key,
    required this.icon,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 26,
            color: color ?? const Color(0xFF9CA3AF),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: textSoft),
          ),
        ],
      ),
    );
  }
}
