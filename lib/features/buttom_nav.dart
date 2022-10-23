import 'package:custom_line_indicator_bottom_navbar/custom_line_indicator_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../router/router_name.dart';

class ButtonNavBar extends ConsumerStatefulWidget {
  const ButtonNavBar({super.key, required this.child});
  final Widget child;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends ConsumerState<ButtonNavBar> {
  static int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith(RouteName.home.path)) {
      return 0;
    }
    if (location.startsWith(RouteName.search.path)) {
      return 1;
    }
    if (location.startsWith(RouteName.post.path)) {
      return 2;
    }
    if (location.startsWith(RouteName.massage.path)) {
      return 3;
    }
    if (location.startsWith(RouteName.notification.path)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(RouteName.home.name);
        break;
      case 1:
        context.goNamed(RouteName.search.name);
        break;
      case 2:
        context.goNamed(RouteName.post.name);
        break;
      case 3:
        context.goNamed(RouteName.massage.name);
        break;
      case 4:
        context.goNamed(RouteName.notification.name);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomLineIndicatorBottomNavbar(
        selectedColor: Colors.blue,
        unSelectedColor: Colors.grey,
        backgroundColor: Theme.of(context).colorScheme.surface,
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
        enableLineIndicator: true,
        lineIndicatorWidth: 3,
        indicatorType: IndicatorType.Top,
        customBottomBarItems: [
          CustomBottomBarItems(
            label: 'Home',
            icon: Icons.home,
          ),
          CustomBottomBarItems(
            label: 'Search',
            icon: Icons.search,
          ),
          CustomBottomBarItems(
            label: 'Post',
            icon: Icons.play_circle,
          ),
          CustomBottomBarItems(
            label: 'Message',
            icon: Icons.chat_bubble_outline,
          ),
          CustomBottomBarItems(
            label: 'Notification',
            icon: Icons.notifications,
          ),
        ],
      ),
      body: widget.child,
    );
  }
}
