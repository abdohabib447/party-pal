import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/theme/app_color.dart';
import '../../core/constants/theme/app_font.dart';
import '../../core/constants/theme/post_data.dart';
import '../../core/widgets/category_button.dart';
import '../../core/widgets/party_post_card.dart';

class PartyPalHomeScreen extends StatelessWidget {
  const PartyPalHomeScreen({Key? key}) : super(key: key);
  static const routeName = "home screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disables back button for home
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'Party Pal',
          style: AppFonts.brandHeader,
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search), color: AppColors.textBody, onPressed: () {}),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(icon: const Icon(Icons.notifications_none), color: AppColors.textBody, onPressed: () {}),
              Positioned(
                top: 10,
                right: 12,
                child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle)),
              )
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // 1. Search Bar (Pinned so it doesn't scroll)
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              minHeight: 60.0,
              maxHeight: 60.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: AppColors.background,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
                    hintText: 'Search party designs, designers, products...',
                    hintStyle: AppFonts.bodyText.copyWith(color: Colors.grey[400]),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ),

          // 2. Categories List (Scrollable)
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
              child: Row(
                children: [
                  CategoryButton(
                    icon: Icons.brightness_1, // Replaced placeholder with simple dot
                    label: 'All',
                    backgroundColor: AppColors.accentPaleGreen,
                    isSelected: true,
                    onTap: () {},
                  ),
                  CategoryButton(icon: CupertinoIcons.heart, label: 'Birthdays', onTap: () {}),
                  CategoryButton(icon: Icons.child_friendly, label: 'Baby Showers', onTap: () {}),
                  CategoryButton(icon: Icons.favorite, label: 'Weddings', onTap: () {}),
                  CategoryButton(icon: Icons.star_border, label: 'Other', onTap: () {}),
                ],
              ),
            ),
          ),

          // 3. The Feed Posts (The main list)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return PartyPostCard(post: samplePosts[index]);
                },
                childCount: samplePosts.length, // Number of posts in our data list
              ),
            ),
          ),
        ],
      ),

      // 4. Custom Bottom Navigation Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.border, width: 1)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: AppColors.accentGreen,
          unselectedItemColor: Colors.grey[400],
          currentIndex: 0,
          onTap: (index) {
            // Handle nav index change
          },
          selectedLabelStyle: AppFonts.navText,
          unselectedLabelStyle: AppFonts.navText,
          items: [
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(color: AppColors.accentGreen, shape: BoxShape.circle),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
              label: '',
            ),
            const BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Messages'),
            const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}

// Helper class for the pinned search bar
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}