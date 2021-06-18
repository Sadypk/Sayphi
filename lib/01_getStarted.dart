import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/authentication/view/04_LoginWithMobileEmailScreen.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/components/shaderBgBody.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appImages.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/resources/stringResources.dart';

import 'mainApp/resources/appColor.dart';
import 'mainApp/resources/appImages.dart';
import 'mainApp/view/home.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.PRIMARY,
      body: ShaderBgBody(
          body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// TITLE IMAGE
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    Images.COUPLE_HOLDING_HANDS,
                    color: Colors.white,
                    height: Get.height * .5,
                  ),
                ),

                /// WELCOME TEXTS
                Text(
                  Strings.GetStartedScreen_Welcome,
                  style: TextStyle(fontSize: 24, letterSpacing: 2.2, fontFamily: CFontFamily.LIGHT, color: Colors.white),
                ),
                SizedBox(height: 4),
                Text(
                  Strings.APP_NAME,
                  style: TextStyle(fontSize: 44, letterSpacing: 1.3, fontFamily: CFontFamily.MEDIUM, color: Colors.white),
                ),

                /// GO TO SIGN UP PAGE BTN
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: MainButton(
                    onPress: () {
                      Get.to(() => Home());
                      // Get.to(()=>SignUpScreen());
                    },
                    btnColor: Colors.white,
                    label: Strings.GetStartedScreen_Btn_SignUp,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    Strings.Or,
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 18,
                      fontFamily: CFontFamily.REGULAR,
                    ),
                  ),
                ),

                /// LOGIN
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: Strings.AlreadyHaveAcc,
                      style: TextStyle(fontSize: 16, fontFamily: CFontFamily.REGULAR, color: Colors.white, height: 1.3),
                      children: [
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => LoginWithMobileEmailScreen());
                              },
                            text: Strings.Login,
                            style: TextStyle(fontSize: 16, fontFamily: CFontFamily.REGULAR, color: AppColor.PRIMARY)),
                        TextSpan(text: Strings.Here, style: TextStyle(fontSize: 16, fontFamily: CFontFamily.REGULAR, color: Colors.white))
                      ]),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// FOOTER
                Text(
                  Strings.GetStartedScreen_Footer1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontFamily: CFontFamily.REGULAR, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: RichText(
                    text: TextSpan(
                        text: Strings.PrivacyPolicy,
                        style: TextStyle(fontSize: 12, fontFamily: CFontFamily.MEDIUM, color: Colors.white, decoration: TextDecoration.underline),
                        children: [
                          TextSpan(text: Strings.AND, style: TextStyle(fontFamily: CFontFamily.REGULAR, decoration: TextDecoration.none)),
                          TextSpan(
                              text: Strings.ToS,
                              style: TextStyle(
                                fontFamily: CFontFamily.MEDIUM,
                              ))
                        ]),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
