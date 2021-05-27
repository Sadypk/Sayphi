import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/resources/appImages.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/util/localStorage.dart';

class WomenMakeFirstMoveDialog extends StatelessWidget {
  const WomenMakeFirstMoveDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4,sigmaY: 4),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: Get.height * .25),
            color: Colors.white.withOpacity(.05),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 4,
                        blurRadius: 4
                      )
                    ]
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      AspectRatio(
                        aspectRatio: 335/205,
                        child: Image.asset(Images.DIALOG_IMAGE_FEMALE)
                      ),

                      Text(
                        'Women makes the first move. When you match with someone, they have to send a message first. Men can send presents with a message anytime',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: CFontFamily.REGULAR
                        ),
                      )

                    ],
                  ),
                ),
                Positioned(right: 0,child: CloseButton(
                  onPressed: () async{
                    await LocalStorage().firstLoginDone();
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
