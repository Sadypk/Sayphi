import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/01_getStarted.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sayphi',
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: AppColor.TEXT_COLOR,
          displayColor: AppColor.TEXT_COLOR,
        ),
        scaffoldBackgroundColor: AppColor.SCAFFOLD_BACKGROUND,
        fontFamily: FontStyle.FONT_LIGHT
      ),
      home: GetStartedScreen(),
    );
  }
}
