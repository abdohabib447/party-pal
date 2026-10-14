import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 6),
        Text('5.0'),
      ],
    );
  }
}
