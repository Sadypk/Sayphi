import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sayphi/authentication/view/loginScreen.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appImages.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/resources/stringResources.dart';
import 'package:sayphi/mainApp/resources/svgResource.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 2),(){
    //   Get.off(()=>LoginScreen());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 52),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 10),
            child: AspectRatio(
              aspectRatio: 346/208,
              child: Image.asset(Images.GET_STARTED_TOP)
            ),
          ),
          SizedBox(height: 32),
          Text(
            Strings.GetStartedScreen_Welcome,
            style: TextStyle(
              fontSize: 24,
              letterSpacing: 2,
              fontFamily: FontStyle.FONT_LIGHT,

            ),
          ),
          SizedBox(height: 4),
          Text(
            Strings.APP_NAME,
            style: TextStyle(
              fontSize: 44,
              letterSpacing: 1.3,
              fontFamily: FontStyle.FONT_MEDIUM,

            ),
          ),
          SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MainButton(
              label: Strings.GetStartedScreen_Btn_SignUp,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              Strings.GetStartedScreen_Or,
              style: TextStyle(
                color: AppColor.TEXT_COLOR.withOpacity(.5),
                fontSize: 18,
                fontFamily: FontStyle.FONT_REGULAR
              ),
            ),
          ),

          RichText(
            text: TextSpan(
              text: Strings.GetStartedScreen_LoginPrefix,
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontStyle.FONT_REGULAR,
                color: AppColor.TEXT_COLOR
              ),
              children: [
                TextSpan(
                  text: Strings.GetStartedScreen_Login,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontStyle.FONT_REGULAR,
                    color: AppColor.PRIMARY
                  )
                ),
                TextSpan(
                  text: Strings.GetStartedScreen_LoginSuffix,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: FontStyle.FONT_REGULAR,
                    color: AppColor.TEXT_COLOR
                  )
                )
              ]
            ),
          ),

          Spacer(),
          Text(
            Strings.GetStartedScreen_Footer1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontFamily: FontStyle.FONT_REGULAR,
            ),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
                text: Strings.GetStartedScreen_Footer2PP,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: FontStyle.FONT_REGULAR,
                    color: AppColor.PRIMARY
                ),
                children: [
                  TextSpan(
                      text: Strings.GetStartedScreen_Footer,
                      style: TextStyle(
                          fontFamily: FontStyle.FONT_REGULAR,
                          color: AppColor.TEXT_COLOR
                      )
                  ),
                  TextSpan(
                      text: Strings.GetStartedScreen_Footer2ToS,
                      style: TextStyle(
                          fontFamily: FontStyle.FONT_REGULAR,
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
