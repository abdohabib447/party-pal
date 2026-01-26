import 'package:flutter/material.dart';
import 'package:party_pal2/peresentation/pages/designer_profile_page.dart';
import 'package:party_pal2/peresentation/widget/designer_card.dart';

class DesignersPage extends StatelessWidget {
  static final String routeName = "designer route";
  const DesignersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        title: const Text('Designers'),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => DesignerCard(
          imageUrl: "assets/photo/download.png",
          name: 'Emma Wilson',
          location: 'Brooklyn, NY',
          style: 'Elegant and Minimalist',
          rating: 4.5,
          reviews: 34,
          onViewProfile: () {
            Navigator.pushNamed(context, DesignerProfilePage.routeName);
          },
        ),
      ),
    );
  }
}
