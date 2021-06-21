import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/01_getStarted.dart';
import 'package:sayphi/features/chat_menu/view/chat_main_screen.dart';
import 'package:sayphi/features/create_audio_room/view/create_new_room.dart';
import 'package:sayphi/features/live/view/live.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/sady/view/46_settings_page.dart';
import 'package:sayphi/sady/view/48_more_button_page_(button_6).dart';
import 'package:sayphi/sady/view/51_view_all_stories.dart';
import 'package:sayphi/sady/view/52_see_stories.dart';
import 'package:sayphi/sady/view/54_followers.dart';
import 'package:sayphi/sady/view/56_top_ranked_people.dart';
import 'package:sayphi/sady/view/58_transactions.dart';
import 'package:sayphi/sady/view/59_privacy_policy.dart';
import 'package:sayphi/sady/view/60_extra_options.dart';
import 'package:sayphi/sady/view/62_challenge_friends_version_1.dart';
import 'package:sayphi/sady/view/63_challenge_game_page.dart';
import 'package:sayphi/sady/view/65_likes_button_page.dart';
import 'package:sayphi/sady/view/widgets/top_ranked_tile.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sayphi',
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColor.TEXT_COLOR
          )
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppColor.TEXT_COLOR,
          displayColor: AppColor.TEXT_COLOR,
        ),
        scaffoldBackgroundColor: AppColor.SCAFFOLD_BACKGROUND,
        fontFamily: CFontFamily.LIGHT
      ),
      // home: GetStartedScreen(),
      home: LikesButtonPage(),
    );
  }
}
