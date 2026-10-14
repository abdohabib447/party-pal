import 'package:flutter/material.dart';

import '../constants/theme/app_color.dart';
import '../constants/theme/app_font.dart';

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.backgroundColor,
    this.iconColor,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.accentPaleGreen.withOpacity(0.2),
          border: isSelected ? Border.all(color: AppColors.accentPaleGreen, width: 2) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, size: 24, color: iconColor ?? AppColors.accentGreen),
            const SizedBox(height: 8),
            Text(
              label,
              style: AppFonts.bodyText.copyWith(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}