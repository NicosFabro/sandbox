import 'package:flutter/material.dart';

class InstagramProfileTabBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.grid_on_outlined)),
          Tab(icon: Icon(Icons.play_arrow_outlined)),
          Tab(icon: Icon(Icons.person_pin_outlined)),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
