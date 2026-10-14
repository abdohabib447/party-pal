class PostData {
  final String userAvatar;
  final String userName;
  final String userTypeLocation;
  final String postTitle;
  final String postBody;
  final List<String> imageUrls;
  final String mainTag;
  final int likes;
  final int comments;

  PostData({
    required this.userAvatar,
    required this.userName,
    required this.userTypeLocation,
    required this.postTitle,
    required this.postBody,
    required this.imageUrls,
    required this.mainTag,
    required this.likes,
    required this.comments,
  });
}

// Sample Data derived from the image
final List<PostData> samplePosts = [
  PostData(
    userAvatar: 'assets/user_avatar_1.png', // Replace with asset image path
    userName: 'Lama Designs',
    userTypeLocation: 'Party Designer • Cairo',
    postTitle: 'A dreamy first birthday 💖',
    postBody: 'Soft pastels, lots of love, and a little bit of magic ✨ The perfect setup for a special little one\'s big day!',
    imageUrls: ['assets/post_image_1.png', 'assets/post_image_2.png', 'assets/post_image_3.png'], // Add your assets
    mainTag: '1st Birthday',
    likes: 124,
    comments: 12,
  ),
  PostData(
    userAvatar: 'assets/user_avatar_2.png',
    userName: 'Bloom Party Co.',
    userTypeLocation: 'Party Designer • New Cairo',
    postTitle: 'Garden vibes 🌿',
    postBody: 'A fresh and elegant garden-themed setup for a beautiful celebration.',
    imageUrls: ['assets/post_image_4.png', 'assets/post_image_5.png', 'assets/post_image_6.png'],
    mainTag: 'Garden Party',
    likes: 85,
    comments: 6,
  ),
];