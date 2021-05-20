import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/shaderBgBody.dart';

import '../../mainApp/components/mainButton.dart';
import '../../mainApp/resources/appColor.dart';
import '../../mainApp/resources/appImages.dart';
import '../../mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/components/cTextFiel.dart';
import 'package:sayphi/authentication/view/05_verify_otp_code.dart';

class LoginWithMobileEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.PRIMARY,
      body: ShaderBgBody(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              ///top image
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

              /// bottom login form section
              Expanded(
                  flex: 65,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Login with email/phone',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: CFontFamily.FONT_REGULAR
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Login your phone number or\nemail address',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: CFontFamily.FONT_REGULAR
                          ),
                        ),
                        SizedBox(height: 32),

                        /// country picker with number input field
                        CTextField(
                          hintText: 'Enter your phone number/email'
                        ),
                        SizedBox(height: 20),
                        CTextField(
                            hintText: 'Enter your password'
                        ),


                        SizedBox(height: 32),

                        MainButton(
                            onPress: () => Get.to(() => VerifyOtpScreen()),
                            btnColor: Colors.white,
                            label: 'Login'
                        )
                      ],
                    ),
                  )
              )


            ],
          ),
        ),
      ),
    );
  }
}
