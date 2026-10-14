import 'package:flutter/material.dart';
import 'package:party_pal2/peresentation/pages/designer_profile_page.dart';

class PostsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (_, __) => _PostCard(),
    );
  }
}

class _PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [DesignerProfilePage.encourageShadow()],
          ),
        ),
        const SizedBox(height: 8),
        const Text('Lovely party decor'),
        const SizedBox(height: 4),
        const Row(
          children: [
            Icon(Icons.favorite_border, size: 18),
            SizedBox(width: 4),
            Text('154'),
          ],
        ),
      ],
    );
  }
}
