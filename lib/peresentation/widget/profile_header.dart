import 'package:flutter/material.dart';
import 'package:party_pal2/peresentation/widget/rate.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleAvatar(radius: 45, backgroundColor: Colors.grey),
        SizedBox(height: 12),
        Text(
          'Charlotte Warren',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'Bringing joy to every celebration!',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 8),
        Rating(),
      ],
    );
  }
}
