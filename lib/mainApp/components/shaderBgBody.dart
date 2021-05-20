import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/appImages.dart';

class ShaderBgBody extends StatelessWidget {
  final Widget body;
  const ShaderBgBody({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        /// shader mask images
        Positioned(
          left: -100,
          right: -100,
          bottom: -Get.height * .2,
          child: Image.asset(
            Images.BG_DARK
          ),
        ),
        Positioned(
          left: -100,
          right: -100,
          bottom: -Get.height * .025,
          child: Image.asset(
            Images.BG_LIGHT
          ),
        ),
        /// shader mask images

        SafeArea(
          child: body,
        ),
      ],
    );
  }
}
