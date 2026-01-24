import 'package:flutter/material.dart';

class UpcomingEvents extends StatelessWidget {
  final List<String> events;
  final VoidCallback onSort;

  const UpcomingEvents({super.key, required this.events, required this.onSort});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Upcoming Events', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Spacer(),
            IconButton(onPressed: onSort, icon: const Icon(Icons.sort)),
          ],
        ),
        ...events.map((e) => Card(
          child: ListTile(
            title: Text(e),
            leading: const Icon(Icons.event),
          ),
        )).toList(),
      ],
    );
  }
}