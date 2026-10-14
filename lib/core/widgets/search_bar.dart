import 'package:flutter/material.dart';
import 'package:party_pal2/peresentation/pages/designer_profile_page.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
         DesignerProfilePage.encourageShadow(),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
