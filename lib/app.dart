import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/splashScreen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sayphi',
      defaultTransition: Transition.cupertino,
      home: SplashScreen(),
    );
  }
}
