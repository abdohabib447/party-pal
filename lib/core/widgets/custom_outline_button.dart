import 'package:flutter/material.dart';

import '../constants/theme/app_color.dart';
import '../constants/theme/app_font.dart';

class CustomOutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomOutlineButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: const BorderSide(color: AppColors.border),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onPressed: onPressed,
      child: Text(text, style: AppFonts.bodyText.copyWith(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.textBody)),
    );
  }
}