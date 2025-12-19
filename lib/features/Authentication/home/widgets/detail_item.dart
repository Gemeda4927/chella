import 'package:chella/core/constants/home_constants.dart';
import 'package:flutter/material.dart';

class DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isLast;
  final bool showArrow; 

  const DetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.isLast = false,
    this.showArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: isLast
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
        border: isLast
            ? null
            : Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, size: 24, color: Colors.grey[700]),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: kDetailLabelStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: kDetailValueStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          if (showArrow)
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[400]),
        ],
      ),
    );
  }
}
