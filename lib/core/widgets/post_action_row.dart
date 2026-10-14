import 'package:flutter/material.dart';

import '../constants/theme/app_color.dart';
import '../constants/theme/app_font.dart';

class PostActionRow extends StatelessWidget {
  final int likes;
  final int comments;

  const PostActionRow({Key? key, required this.likes, required this.comments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppColors.border, width: 1))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ActionButton(icon: Icons.favorite_border, label: '$likes'),
          _ActionButton(icon: Icons.chat_bubble_outline, label: '$comments'),
          const _ActionButton(icon: Icons.share_outlined),
          const Spacer(),
          const Icon(Icons.bookmark_border, color: AppColors.textBody),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String? label;

  const _ActionButton({Key? key, required this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textBody, size: 20),
          if (label != null) ...[
            const SizedBox(width: 6),
            Text(label!, style: AppFonts.bodyText),
          ]
        ],
      ),
    );
  }
}