import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/components/shaderBgBody.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

import '../../mainApp/components/mainButton.dart';
import '../../mainApp/resources/appColor.dart';
import '../../mainApp/resources/appImages.dart';
import '../../mainApp/resources/fontStyle.dart';

class SignUpWithMobileScreen extends StatelessWidget {
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

              /// bottom mobile number input section
              Expanded(
                  flex: 65,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Continue with phone',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: CFontFamily.REGULAR
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Please enter your valid phone number. We will send\nyou a 4 digit code to verify your account.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: CFontFamily.REGULAR
                          ),
                        ),
                        SizedBox(height: 32),

                        /// country picker with number input field
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)
                          ),
                          child: Row(
                            children: [
                              CountryCodePicker(
                                onChanged: print,
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: 'IT',
                                favorite: ['+39','FR'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                              ),

                              Container(
                                height: 20,
                                width: 1,
                                color: AppColor.TEXT_LIGHT
                              ),

                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter number',
                                    contentPadding: EdgeInsets.only(left: 12)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),


                        SizedBox(height: 20),

                        MainButton(
                          onPress: (){},
                          btnColor: Colors.white,
                          label: 'Continue'
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