import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:party_pal2/peresentation/bloc/profile_bloc.dart';
import 'package:party_pal2/peresentation/widget/grid.dart';
import 'package:party_pal2/peresentation/widget/profile_header.dart';
import 'package:party_pal2/peresentation/widget/tabs.dart';

class DesignerProfilePage extends StatelessWidget {
  static final String routeName = "design profile page";

  const DesignerProfilePage({super.key});
  static BoxShadow encourageShadow() {
  return BoxShadow(
    color: Colors.black.withOpacity(0.08),
    blurRadius: 8,
    offset: const Offset(0, 4),
  );
}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeTabBloc(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: SearchBar(),
        actions: [
          IconButton(
            icon: const Icon(Icons.message_outlined, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            FadeInDown(child: ProfileHeader()),
            const SizedBox(height: 20),
            FadeIn(child: Tabs()),
            const SizedBox(height: 20),
            FadeInUp(child: PostsGrid()),
          ],
        ),
      ),
    );
  }
}
