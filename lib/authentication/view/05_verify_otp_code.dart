import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sayphi/authentication/repository/authRepo.dart';
import 'package:sayphi/authentication/repository/socialAuth.dart';
import 'package:sayphi/mainApp/components/screenLoader.dart';
import 'package:sayphi/mainApp/components/shaderBgBody.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/user/view/06+7+8_how_do_you_identify_screen.dart';
import 'dart:async';
import '../../mainApp/components/mainButton.dart';
import '../../mainApp/resources/appColor.dart';
import '../../mainApp/resources/appImages.dart';
import '../../mainApp/resources/fontStyle.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phoneNumber;
  const VerifyOtpScreen({required this.phoneNumber});

  @override
  _VerifyOtpScreenState createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;
  final textEditingController = TextEditingController();
  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
    sendOTP();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  String? verificationId;
  bool loading = true;
  void sendOTP() async{

    await SocialAuth.auth.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {},
      verificationFailed: (verificationFailed) async {
        /// show error
        setState(() {
          loading = false;
        });
        Snack.showError(message: 'Failed a to send message');
      },
      codeSent: (vID, resendingToken) async {
        verificationId = vID;
        setState(() {
          loading = false;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );

  }

  @override
  Widget build(BuildContext context) {
    return ScreenLoader(
      loader: loading,
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

                /// bottom pin input section
                Expanded(
                    flex: 65,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            'Verify OTP Code',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: CFontFamily.REGULAR
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Enter the verification code that we\'ve sent you',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: CFontFamily.REGULAR
                            ),
                          ),
                          SizedBox(height: 40),

                          /// country picker with number input field
                          // PinCodeTextField(
                          //   length: 6,
                          //   obscureText: false,
                          //   animationType: AnimationType.fade,
                          //   pinTheme: PinTheme(
                          //     activeColor: Colors.white,
                          //     inactiveColor: Colors.white,
                          //     disabledColor: Colors.white,
                          //     inactiveFillColor: Colors.white,
                          //     selectedColor: Colors.white,
                          //     selectedFillColor: Colors.white,
                          //     shape: PinCodeFieldShape.box,
                          //     borderRadius: BorderRadius.circular(5),
                          //     fieldHeight: 50,
                          //     fieldWidth: 60,
                          //     activeFillColor: Colors.white,
                          //   ),
                          //   animationDuration: Duration(milliseconds: 300),
                          //   backgroundColor: Colors.transparent,
                          //   enableActiveFill: true,
                          //   inputFormatters: [
                          //     FilteringTextInputFormatter.digitsOnly
                          //   ],
                          //   keyboardType: TextInputType.number,
                          //   errorAnimationController: errorController,
                          //   controller: textEditingController,
                          //   onCompleted: (v) {
                          //     print("Completed");
                          //   },
                          //   onChanged: (value) {
                          //     print(value);
                          //     setState(() {
                          //       currentText = value;
                          //     });
                          //   },
                          //   beforeTextPaste: (text) {
                          //     print("Allowing to paste $text");
                          //     //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //     //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          //     return true;
                          //   }, appContext: context,
                          // ),


                          TextField(
                            controller: textEditingController,
                          ),

                          SizedBox(height: 20),

                          MainButton(
                            onPress: (){

                              SocialAuth.verifyOtp(verificationId!, textEditingController.text);

                              // Get.to(()=>UserGenderSetScreen());
                            },
                            label: 'Verify'
                          ),

                          SizedBox(height: 32),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Didn\'t get code? ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[200]
                                )),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    loading = true;
                                  });
                                  sendOTP();
                                },
                                child: Container(
                                  child: Text(
                                      'Send Again',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                          fontFamily: CFontFamily.MEDIUM
                                      )
                                  ),
                                ),
                              )]
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
