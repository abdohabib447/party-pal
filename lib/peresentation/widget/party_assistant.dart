import 'package:flutter/material.dart';

class PartyAssistant extends StatelessWidget {
  const PartyAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        '🎉 Party Assistant is ready to help you plan your event!',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}