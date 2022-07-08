import 'package:bee/screens/cart_screen/empty_cart.dart';
import 'package:bee/screens/home_screen/home_page.dart';
import 'package:bee/screens/order_screen/track_orders.dart';
import 'package:bee/screens/profile_screen/profile.dart';
import 'package:bee/screens/sos_screen/sos_screen.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class PersistentNavBar extends StatefulWidget {
  final int initial;
  PersistentNavBar({this.initial = 0});

  @override
  State<PersistentNavBar> createState() => _PersistentNavBarState();
}

class _PersistentNavBarState extends State<PersistentNavBar> {
  List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.home_outlined,
      ),
      title: 'Home',
      inactiveColorPrimary: Consts().greyColor,
      activeColorPrimary: Consts().primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.track_changes_rounded,
      ),
      title: 'Track',
      inactiveColorPrimary: Consts().greyColor,
      activeColorPrimary: Consts().primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.sos_rounded),
      title: 'SOS',
      inactiveColorPrimary: Consts().greyColor,
      activeColorPrimary: Consts().primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.shopping_cart_outlined),
      title: 'Cart',
      inactiveColorPrimary: Consts().greyColor,
      activeColorPrimary: Consts().primaryColor,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(
        Icons.account_circle,
      ),
      title: 'Account',
      inactiveColorPrimary: Consts().greyColor,
      activeColorPrimary: Consts().primaryColor,
    ),
  ];
  late PersistentTabController _controller;
  @override
  void initState() {
    // TODO: implement initState

    _controller = PersistentTabController(initialIndex: widget.initial);
  }

// TODO: Navbar Configuration
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      navBarStyle: NavBarStyle.style8,
      neumorphicProperties: NeumorphicProperties(showSubtitleText: true),
      screenTransitionAnimation: ScreenTransitionAnimation(
          curve: Curves.bounceIn,
          animateTabTransition: true,
          duration: Duration(milliseconds: 500)),
      screens: [
        HomePage(),
        TrackOrders(),
        // HomePage(),
        SosScreen(),
        EmptyCart(),
        ProfilePage(),
      ],
      items: items,
    );
  }
}
