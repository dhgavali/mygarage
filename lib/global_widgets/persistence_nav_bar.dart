import 'package:bee/screens/home_screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class PersistentNavBar extends StatefulWidget {
  const PersistentNavBar({Key? key}) : super(key: key);

  @override
  State<PersistentNavBar> createState() => _PersistentNavBarState();
}

class _PersistentNavBarState extends State<PersistentNavBar> {
  List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(icon: Icon(Icons.home_outlined), title: 'Home'),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.track_changes_rounded), title: 'Track'),
    PersistentBottomNavBarItem(icon: Icon(Icons.sos_rounded), title: 'SOS'),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart_outlined), title: 'Cart'),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle), title: 'Account'),
  ];
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      navBarStyle: NavBarStyle.style13,
      screenTransitionAnimation: ScreenTransitionAnimation(
          curve: Curves.bounceIn,
          animateTabTransition: true,
          duration: Duration(milliseconds: 500)),
      screens: [
        HomePage(),
        HomePage(),
        HomePage(),
        HomePage(),
        HomePage(),
      ],
      items: items,
    );
  }
}
