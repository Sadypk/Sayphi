import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/chat_messaging/view/32_chat_main_screen.dart';
import 'package:sayphi/features/homeScreen/view/23_24_homeScreen.dart';
import 'package:sayphi/features/homeScreen/view/33_live_Screen.dart';
import 'package:sayphi/features/homeScreen/view/65_likes_buttons_screen.dart';
import 'package:sayphi/mainApp/components/customBottomNav/lib/fancy_bottom_navigation.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/util/localStorage.dart';
import 'package:sayphi/user/view/22_fullWidthDialog.dart';

import '../../demo_files.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _screens = [
    HomeScreen(),
    ChatMainScreen(),
    LiveScreen(),
    LikesListScreen(),
    Container(color: Colors.orangeAccent),
  ];

  final _navItems = [
    TabData(
      icon: Icons.home,
      color: Color(0xffAC2585),
    ),
    TabData(
      icon: CupertinoIcons.chat_bubble_2_fill,
      color: Color(0xff4975FF),
    ),
    TabData(
      icon: Icons.live_tv,
      color: Color(0xffE74C3C),
    ),
    TabData(
      icon: Icons.favorite,
      color: Color(0xffF74231),
    ),
    TabData(
      icon: Icons.flash_on_rounded,
      color: Color(0xffECBB16),
    ),
  ];

  int _screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    _buildAppBar() {
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          _screenIndex == 0 ? 'Home' :
              _screenIndex == 1 ? 'Chat' :
                  _screenIndex == 2 ? 'Live' :
                      _screenIndex == 3 ? 'Likes' :
                          'Boost',
          style: TextStyle(
            color: AppColor.TEXT_COLOR,
            fontFamily: CFontFamily.MEDIUM
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              Demo.PROFILE_IMAGE
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.more_horiz,
                color: AppColor.DARK_GREY,
              ),
            )
          )
        ],
      );
    }

    return Stack(
      children: [
        Scaffold(

          appBar: _buildAppBar(),

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
