import 'package:flutter/material.dart';

class RecentPosts extends StatelessWidget {
  final List<String> posts;
  final VoidCallback onFilter;

  const RecentPosts({super.key, required this.posts, required this.onFilter});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Recent Posts', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Spacer(),
            IconButton(onPressed: onFilter, icon: const Icon(Icons.filter_list)),
          ],
        ),
        ...posts.map((p) => Card(
          child: ListTile(
            title: Text(p),
            leading: const Icon(Icons.post_add),
          ),
        )).toList(),
      ],
    );
  }
}