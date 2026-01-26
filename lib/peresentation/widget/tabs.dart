import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:party_pal2/peresentation/bloc/profile_bloc.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabBloc, HomeTabState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _TabItem(
              title: 'Timeline',
              selected: state.tab == HomeTab.timeline,
              onTap: () =>
                  context.read<HomeTabBloc>().add(ChangeTab(HomeTab.timeline)),
            ),
            const SizedBox(width: 32),
            _TabItem(
              title: 'Reviews',
              selected: state.tab == HomeTab.reviews,
              onTap: () =>
                  context.read<HomeTabBloc>().add(ChangeTab(HomeTab.reviews)),
            ),
          ],
        );
      },
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _TabItem({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selected ? Colors.blue : Colors.grey,
            ),
          ),
          if (selected)
            Container(
              width: 40,
              height: 2,
              margin: const EdgeInsets.only(top: 4),
              color: Colors.blue,
            )
        ],
      ),
    );
  }
}
