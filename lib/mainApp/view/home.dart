import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/homeScreen/view/23_24_homeScreen.dart';
import 'package:sayphi/mainApp/components/customBottomNav/lib/fancy_bottom_navigation.dart';
import 'package:sayphi/mainApp/util/localStorage.dart';
import 'package:sayphi/user/view/22_fullWidthDialog.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _screens = [
    HomeScreen(),
    Container(color: Colors.red),
    Container(color: Colors.black),
    Container(color: Colors.pinkAccent),
    Container(color: Colors.orangeAccent),
  ];

  final _navItems = [
    TabData(
      icon: Icons.home,
      color: Color(0xffAC2585),
      title: 'Home'
    ),
    TabData(
      icon: CupertinoIcons.chat_bubble_2_fill,
      color: Color(0xff4975FF),
      title: 'Chat'
    ),
    TabData(
      icon: Icons.live_tv,
      color: Color(0xffE74C3C),
      title: 'Live'
    ),
    TabData(
      icon: Icons.favorite,
      color: Color(0xffF74231),
      title: 'Favourites'
    ),
    TabData(
      icon: Icons.flash_on_rounded,
      color: Color(0xffECBB16),
      title: 'Boost',
    ),
  ];

  int _screenIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Scaffold(
          body: IndexedStack(
            index: _screenIndex,
            children: _screens,
          ),
          bottomNavigationBar: FancyBottomNavigation(
            tabs: _navItems,
            onTabChangedListener: (index) => setState(() => _screenIndex = index),
          ),
        ),

        /// should come up only for the first time when user comes here
        Obx(() {
          if(LocalStorage.isFirstLogin.value) {
            return WomenMakeFirstMoveDialog();
          }else{
            return SizedBox();
          }
        })
      ],
    );
  }
}
