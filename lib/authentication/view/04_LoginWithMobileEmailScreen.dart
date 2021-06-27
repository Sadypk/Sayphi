import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/authentication/repository/authRepo.dart';
import 'package:sayphi/mainApp/components/screenLoader.dart';
import 'package:sayphi/mainApp/components/shaderBgBody.dart';
import 'package:sayphi/mainApp/view/home.dart';

import '../../mainApp/components/mainButton.dart';
import '../../mainApp/resources/appColor.dart';
import '../../mainApp/resources/appImages.dart';
import '../../mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/components/cTextFiel.dart';

class LoginWithMobileEmailScreen extends StatefulWidget {
  @override
  _LoginWithMobileEmailScreenState createState() => _LoginWithMobileEmailScreenState();
}

class _LoginWithMobileEmailScreenState extends State<LoginWithMobileEmailScreen> {

  final _valueController = TextEditingController();
  final _passController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return ScreenLoader(
      child: Scaffold(
        backgroundColor: AppColor.PRIMARY,
        body: ShaderBgBody(
          child: Padding(
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
                                fontFamily: CFontFamily.REGULAR
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Login your phone number or\nemail address',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: CFontFamily.REGULAR
                            ),
                          ),
                          SizedBox(height: 32),

                          /// country picker with number input field
                          CTextField(
                            controller: _valueController,
                            hintText: 'Enter your phone number/email'
                          ),
                          SizedBox(height: 20),
                          CTextField(
                            controller: _passController,
                              hintText: 'Enter your password'
                          ),


                          SizedBox(height: 32),

                          MainButton(
                              onPress: () async{

                                final error = await AuthRepo.loginWithEmailOrNumberAndPassword(_valueController.text, _passController.text);

                                if(!error){
                                  Get.to(() => Home());
                                }

                              },
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
      ),
    );
  }
}
