import 'package:flutter/material.dart';

import 'app_color.dart';
class AppFonts {
  // Since we cannot load the specific custom curly font from the image,
  // we will define a TextStyle that represents its bold, rounded, script-like appearance.
  // In a real app, you would add a font to assets/fonts and reference its family name here.
  static const TextStyle brandHeader = TextStyle(
    fontSize: 28,
    fontFamily: 'Roboto', // Fallback, replace with custom font
    fontWeight: FontWeight.w700,
    color: AppColors.textBody,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 14,
    color: AppColors.textBody,
    height: 1.4, // Line height from image
  );

  static const TextStyle navText = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: AppColors.accentGreen,
  );
}