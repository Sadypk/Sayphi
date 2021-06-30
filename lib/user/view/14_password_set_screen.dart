import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/repository/userRepo.dart';
import 'package:sayphi/user/view/15_terms_and_condition_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({Key? key}) : super(key: key);

  @override
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();

  final password = TextEditingController();
  final confPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {

      });
    });
    _focusNode2.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Almost done! Just set a password',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: CFontFamily.MEDIUM
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Set a password to access your account in the future',
                style: TextStyle(
                    fontFamily: CFontFamily.REGULAR
                ),
              ),

              /// basic info`s suggestions about image uploads
              SizedBox(height: 20),

              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColor.PRIMARY
                    )
                  )
                ),
                child: TextField(
                  focusNode: _focusNode1,
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                    labelStyle: TextStyle(
                      color: _focusNode1.hasPrimaryFocus ? AppColor.PRIMARY : null
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColor.PRIMARY
                      )
                    )
                  ),
                  child: TextField(
                    controller: confPassword,
                    focusNode: _focusNode2,
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
                      labelStyle: TextStyle(
                        color: _focusNode2.hasPrimaryFocus ? AppColor.PRIMARY : null
                      ),
                      border: OutlineInputBorder(borderSide: BorderSide.none)
                    ),
                  ),
                ),
              ),


              SizedBox(height: 32),
              MainButton(
                onPress: (){

                  FocusScope.of(context).unfocus();

                  if(password.text == confPassword.text && password.text.length > 5 && confPassword.text.length > 5){

                    UserRepo.updateProfile(
                      password: password.text,
                      isComplete: true
                    );

                    Get.to(()=>TermsAndConditionAgreementScreen());

                  }else{
                    Snack.top(
                      message: 'Please choose the options to continue'
                    );
                  }


                },
                label: 'Continue'
              )
            ]
          ),
        )
      )
    );
  }
}
