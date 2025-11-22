import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kamus_alirbaath/app/modules/home/views/home_view.dart';
import 'package:kamus_alirbaath/app/theme/app_theme.dart';

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: brandPrimary.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: brandPrimary),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(fontSize: 12, color: kTextDark)),
        ],
      ),
    );
  }
}
