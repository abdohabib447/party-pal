import 'package:flutter/material.dart';
import 'package:party_pal2/core/widgets/post_action_row.dart';
import 'package:party_pal2/core/widgets/user_profile_header.dart';

import '../constants/theme/app_color.dart';
import '../constants/theme/app_font.dart';
import '../constants/theme/post_data.dart';

class PartyPostCard extends StatelessWidget {
  final PostData post;

  const PartyPostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. User Header
          UserProfileHeader(
            avatarAsset: post.userAvatar,
            name: post.userName,
            detail: post.userTypeLocation,
          ),
          const SizedBox(height: 16),
          // 2. Post Title
          Text(
            post.postTitle,
            style: AppFonts.bodyText.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          // 3. Post Body
          Text(post.postBody, style: AppFonts.bodyText),
          const SizedBox(height: 16),
          // 4. Image Gallery (Basic structure for demonstration)
          // We must define how we render 'x images' or the single main image.
          // This code shows a placeholder of the image layout seen.
          _PostImageGallery(imageUrls: post.imageUrls),
          const SizedBox(height: 12),
          // 5. Main Tag
          _MainTag(tag: post.mainTag),
          const SizedBox(height: 16),
          // 6. Action Row
          PostActionRow(likes: post.likes, comments: post.comments),
        ],
      ),
    );
  }
}
class _PostImageGallery extends StatelessWidget {
  final List<String> imageUrls;

  const _PostImageGallery({Key? key, required this.imageUrls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 3, child: _PostImage(assetPath: imageUrls[0])),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(child: _PostImage(assetPath: imageUrls[1])),
                const SizedBox(height: 8),
                Expanded(child: _PostImage(assetPath: imageUrls[2], showOverlay: true, count: 4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  final String assetPath;
  final bool showOverlay;
  final int count;

  const _PostImage({
    Key? key,
    required this.assetPath,
    this.showOverlay = false,
    this.count = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: AssetImage(assetPath), fit: BoxFit.cover),
      ),
      child: showOverlay
          ? Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
        child: Text('+$count', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      )
          : null,
    );
  }
}

/// The pill shape tag below the images.
class _MainTag extends StatelessWidget {
  final String tag;

  const _MainTag({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.accentPaleGreen.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tag,
        style: AppFonts.bodyText.copyWith(color: AppColors.accentGreen, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}