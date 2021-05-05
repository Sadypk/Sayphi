import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/resources/stringResources.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          /// FOOTER
          Spacer(),
          Text(
            Strings.SignUpScreen_Footer,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontFamily: CFontFamily.FONT_REGULAR,
            ),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
                text: Strings.PrivacyPolicy,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: CFontFamily.FONT_REGULAR,
                    color: AppColor.PRIMARY
                ),
                children: [
                  TextSpan(
                      text: Strings.AND,
                      style: TextStyle(
                          fontFamily: CFontFamily.FONT_REGULAR,
                          color: AppColor.TEXT_COLOR
                      )
                  ),
                  TextSpan(
                      text: Strings.ToS,
                      style: TextStyle(
                        fontFamily: CFontFamily.FONT_REGULAR,
                      )
                  )
                ]
            ),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
