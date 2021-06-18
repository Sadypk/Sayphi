import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/01_getStarted.dart';
import 'package:sayphi/features/chat_menu/view/chat_main_screen.dart';
import 'package:sayphi/features/create_audio_room/view/create_new_room.dart';
import 'package:sayphi/features/live/view/live.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/sady/view/46_settings_page.dart';

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
      home: SettingsPage(),
    );
  }
}
