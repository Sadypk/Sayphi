import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/01_getStarted.dart';
import 'package:sayphi/features/agora_streaming/view/agora_streaming.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

import 'user/view/06+7+8_how_do_you_identify_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sayphi',
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        primaryColor: AppColor.PRIMARY,
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
      home: GetStartedScreen(),

      /// Use this for custom routing
      // home: AgoraStreaming(),
    );
  }
}
