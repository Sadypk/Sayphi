import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sayphi/authentication/repository/socialAuth.dart';
import 'package:sayphi/authentication/view/04_LoginWithMobileEmailScreen.dart';
import 'package:sayphi/mainApp/components/shaderBgBody.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

import '../../mainApp/resources/appColor.dart';
import '../../mainApp/resources/appImages.dart';
import '../../mainApp/resources/fontStyle.dart';
import '../../mainApp/resources/stringResources.dart';
import '03_SignUpWithMobileScreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.PRIMARY,
      body: ShaderBgBody(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            children: [
              Expanded(
                  flex: 32,
                  child: Center(
                      child: Image.asset(Images.COMPLEX_HEART,
                          height: 90, width: 90))),
              Expanded(
                  flex: 68,
                  child: Column(
                    children: [
                      Text(
                        'Sign up with',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: CFontFamily.REGULAR),
                      ),

                      SizedBox(height: 24),

                      AuthButton(
                        onPress: SocialAuth.faceBookAuth,
                        color: Color(0xff3B5998),
                        icon: FontAwesomeIcons.facebook,
                        label: 'facebook',
                      ),
                      if (Platform.isAndroid)
                        AuthButton(
                          onPress: SocialAuth.googleAuth,
                          color: Color(0xff4285F4),
                          icon: FontAwesomeIcons.google,
                          label: 'gmail',
                        ),
                      if (Platform.isIOS)
                        AuthButton(
                          onPress: (){},
                          color: Color(0xffDBDBDB),
                          icon: FontAwesomeIcons.apple,
                          label: 'apple',
                          iconColor: AppColor.TEXT_COLOR,
                          textColor: AppColor.TEXT_COLOR,
                        ),
                      AuthButton(
                        onPress: () => Get.to(() => SignUpWithMobileScreen()),
                        color: AppColor.PRIMARY,
                        icon: Icons.call_rounded,
                        label: 'phone number',
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
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: CFontFamily.REGULAR,
                                color: Colors.white,
                                height: 1.3),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(
                                          () => LoginWithMobileEmailScreen());
                                    },
                                  text: Strings.Login,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: CFontFamily.REGULAR,
                                      color: AppColor.PRIMARY)),
                              TextSpan(
                                  text: Strings.Here,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: CFontFamily.REGULAR,
                                      color: Colors.white))
                            ]),
                      ),

                      /// FOOTER
                      Spacer(),
                      SizedBox(height: 12),
                      Text(
                        Strings.GetStartedScreen_Footer1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: CFontFamily.REGULAR,
                            color: Colors.white),
                      ),
                      RichText(
                        text: TextSpan(
                            text: Strings.PrivacyPolicy,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: CFontFamily.MEDIUM,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                            children: [
                              TextSpan(
                                  text: Strings.AND,
                                  style: TextStyle(
                                      fontFamily: CFontFamily.REGULAR,
                                      decoration: TextDecoration.none)),
                              TextSpan(
                                  text: Strings.ToS,
                                  style: TextStyle(
                                    fontFamily: CFontFamily.MEDIUM,
                                  ))
                            ]),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final Color? iconColor;
  final Color? textColor;
  final VoidCallback onPress;

  const AuthButton(
      {required this.onPress,
      required this.icon,
      required this.label,
      required this.color,
      this.iconColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
          onTap: onPress,
          borderRadius: BorderRadius.circular(6),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor ?? Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Continue with ' + label,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: CFontFamily.REGULAR,
                      color: textColor ?? Colors.white),
                )
              ],
            ),
          )),
    );
  }
}
