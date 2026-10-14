import 'package:flutter/material.dart';

import '../constants/theme/app_color.dart';
import '../constants/theme/app_font.dart';
import 'custom_outline_button.dart';
class UserProfileHeader extends StatelessWidget{
  final String avatarAsset;
  final String name;
  final String detail;

  const UserProfileHeader({
    Key? key,
    required this.avatarAsset,
    required this.name,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.border,
          backgroundImage: AssetImage(avatarAsset), // Placeholder asset
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppFonts.bodyText.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Text(
              detail,
              style: AppFonts.bodyText.copyWith(fontSize: 12, color: AppColors.textBody.withOpacity(0.7)),
            ),
          ],
        ),
        const Spacer(),
        CustomOutlineButton(text: 'Follow', onPressed: () {}),
        const SizedBox(width: 4),
        const Icon(Icons.more_vert, color: AppColors.textBody, size: 20),
      ],
    );
  }
}