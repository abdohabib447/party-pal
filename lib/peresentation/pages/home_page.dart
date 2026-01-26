import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:party_pal2/peresentation/bloc/home_bloc.dart';
import 'package:party_pal2/peresentation/pages/designers_page.dart';
import 'package:party_pal2/peresentation/widget/event_card.dart';
import 'package:party_pal2/peresentation/widget/party_assistant.dart';
import 'package:party_pal2/peresentation/widget/recent_posts.dart';
import 'package:party_pal2/peresentation/widget/upcoming_events.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "home_page";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc()..add(LoadHomeData()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EE),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 100,
              floating: true,
              pinned: true,
              snap: true,
              elevation: 0,
              backgroundColor: const Color(0xFFFFF8EE),
              title: FadeInDown(
                duration: const Duration(milliseconds: 500),
                child: _buildSearchBar(),
              ),
              actions: [
                FadeInRight(
                  duration: const Duration(milliseconds: 600),
                  child: IconButton(
                    icon: const Icon(Icons.people_outline, color: Colors.black),
                    tooltip: 'Designers',
                    onPressed: () {
                      Navigator.pushNamed(context, DesignersPage.routeName);
                    },
                  ),
                ),
                FadeInRight(
                  duration: const Duration(milliseconds: 600),
                  child: IconButton(
                    icon: const Icon(
                      Icons.message_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48),
                child: FadeInDown(
                  duration: const Duration(milliseconds: 700),
                  child: _buildTabBar(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [_buildHomeTab(), _buildDiscoverTab(), _buildProfileTab()],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search events, planners...',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: const Color(0xFF6A11CB),
      indicatorWeight: 3,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      tabs: const [
        Tab(text: 'Home'),
        Tab(text: 'Discover'),
        Tab(text: 'Profile'),
      ],
    );
  }

  Widget _buildHomeTab() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeLoaded) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInUp(
                  duration: const Duration(milliseconds: 800),
                  child: EventCard(
                    title: "How do you want to celebrate today?",
                    subtitle:
                        "Mom's birthday coming up?\nPlan a gift she'll love.",
                    buttonText: "Start Planning",
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 24),
                FadeInUp(
                  duration: const Duration(milliseconds: 900),
                  delay: const Duration(milliseconds: 100),
                  child: UpcomingEvents(
                    events: state.events,
                    onSort: () {
                      context.read<HomeBloc>().add(SortEvents());
                    },
                  ),
                ),
                const SizedBox(height: 24),
                FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  delay: const Duration(milliseconds: 200),
                  child: RecentPosts(
                    posts: state.posts,
                    onFilter: () {
                      context.read<HomeBloc>().add(FilterPosts());
                    },
                  ),
                ),
                const SizedBox(height: 24),
                FadeInUp(
                  duration: const Duration(milliseconds: 1100),
                  delay: const Duration(milliseconds: 300),
                  child: const PartyAssistant(),
                ),
              ],
            ),
          );
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildDiscoverTab() {
    return const Center(
      child: Text('Discover Tab', style: TextStyle(fontSize: 24)),
    );
  }

  Widget _buildProfileTab() {
    return const Center(
      child: Text('Profile Tab', style: TextStyle(fontSize: 24)),
    );
  }
}
