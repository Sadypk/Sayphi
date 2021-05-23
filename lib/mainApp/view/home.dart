import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sayphi/features/homeScreen/view/homeScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  final _screens = [
    HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.black),
    Container(color: Colors.pinkAccent),
    Container(color: Colors.orangeAccent),
  ];

  final _navItems = [
    PersistentBottomNavBarItem(
      icon: Icon(Icons.home),
      activeColorPrimary: Color(0xffAC2585),
      inactiveColorPrimary: Color(0xffAC2585),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.chat_bubble_2_fill),
      activeColorPrimary: Color(0xff4975FF),
      inactiveColorPrimary: Color(0xff4975FF),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.live_tv),
      activeColorPrimary: Color(0xffE74C3C),
      inactiveColorPrimary: Color(0xffE74C3C),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.favorite),
      activeColorPrimary: Color(0xffF74231),
      inactiveColorPrimary: Color(0xffF74231),
    ),
    PersistentBottomNavBarItem(
      icon: Icon(Icons.flash_on_rounded),
      activeColorPrimary: Color(0xffECBB16),
      inactiveColorPrimary: Color(0xffECBB16),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _navItems,
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
