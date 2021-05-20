import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/shaderBgBody.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

import '../../mainApp/resources/appColor.dart';
import '../../mainApp/resources/appImages.dart';
import '../../mainApp/resources/fontStyle.dart';
import '../../mainApp/resources/stringResources.dart';
import '03_SignUpWithMobileScreen.dart';
import 'package:sayphi/authentication/view/04_LoginWithMobileEmailScreen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.PRIMARY,
      body: ShaderBgBody(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              Expanded(
                flex: 35,
                child: Center(
                  child: Image.asset(
                    Images.COMPLEX_HEART,
                    height: 90,
                    width: 90
                  )
                )
              ),

              Expanded(
                flex: 65,
                child: Column(
                  children: [
                    Text(
                      'Sign up with',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: CFontFamily.FONT_REGULAR
                      ),
                    ),

                    SizedBox(height: 24),

                    AuthButton(
                      onPress: (){},
                      color: Color(0xff3B5998),
                      icon: FontAwesomeIcons.facebook,
                      label: 'facebook',
                    ),
                    AuthButton(
                      onPress: (){},
                      color: Color(0xff4285F4),
                      icon: FontAwesomeIcons.google,
                      label: 'gmail',
                    ),
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
                      color: Color(0xff3B5998),
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
                          fontFamily: CFontFamily.FONT_REGULAR,
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
                              fontFamily: CFontFamily.FONT_REGULAR,
                              color: Colors.white,
                              height: 1.3
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {
                                Get.to(() => LoginWithMobileEmailScreen());
                              },
                                text: Strings.Login,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: CFontFamily.FONT_REGULAR,
                                    color: AppColor.PRIMARY
                                )
                            ),
                            TextSpan(
                                text: Strings.Here,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: CFontFamily.FONT_REGULAR,
                                    color: Colors.white
                                )
                            )
                          ]
                      ),
                    ),

                    /// FOOTER
                    Spacer(),
                    SizedBox(height: 12),
                    Text(
                      Strings.GetStartedScreen_Footer1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: CFontFamily.FONT_REGULAR,
                          color: Colors.white
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: Strings.PrivacyPolicy,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: CFontFamily.FONT_MEDIUM,
                              color: Colors.white,
                              decoration: TextDecoration.underline
                          ),
                          children: [
                            TextSpan(
                                text: Strings.AND,
                                style: TextStyle(
                                    fontFamily: CFontFamily.FONT_REGULAR,
                                    decoration: TextDecoration.none
                                )
                            ),
                            TextSpan(
                                text: Strings.ToS,
                                style: TextStyle(
                                  fontFamily: CFontFamily.FONT_MEDIUM,
                                )
                            )
                          ]
                      ),
                    ),
                  ],
                )
              )


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
  const AuthButton({
    required this.onPress,
    required this.icon,
    required this.label,
    required this.color,
    this.iconColor,
    this.textColor
});

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
            color: color,
            borderRadius: BorderRadius.circular(6)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor ?? Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'Continue with '+label,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: CFontFamily.FONT_REGULAR,
                  color: textColor ?? Colors.white
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
