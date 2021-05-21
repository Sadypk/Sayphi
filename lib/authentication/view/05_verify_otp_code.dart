import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sayphi/mainApp/components/shaderBgBody.dart';
import 'dart:async';
import '../../mainApp/components/mainButton.dart';
import '../../mainApp/resources/appColor.dart';
import '../../mainApp/resources/appImages.dart';
import '../../mainApp/resources/fontStyle.dart';

class VerifyOtpScreen extends StatefulWidget {
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
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }
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
                        PinCodeTextField(
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            activeColor: Colors.white,
                            inactiveColor: Colors.white,
                            disabledColor: Colors.white,
                            inactiveFillColor: Colors.white,
                            selectedColor: Colors.white,
                            selectedFillColor: Colors.white,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 60,
                            activeFillColor: Colors.white,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.transparent,
                          enableActiveFill: true,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          errorAnimationController: errorController,
                          controller: textEditingController,
                          onCompleted: (v) {
                            print("Completed");
                          },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          }, appContext: context,
                        ),


                        SizedBox(height: 20),

                        MainButton(
                          onPress: (){},
                          label: 'Verify'
                        ),

                        SizedBox(height: 32),
                        RichText(
                          text: TextSpan(
                              text: 'Didn\'t get code? ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[200]
                              ),
                              children: [TextSpan(
                                  text: 'Send Again',
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    fontFamily: CFontFamily.MEDIUM
                                  )
                              )]
                          ),
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
