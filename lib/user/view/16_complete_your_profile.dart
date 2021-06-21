import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/appImages.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/view/home.dart';
import 'package:sayphi/user/view/17_18_19_20_profile_questionsScreen.dart';

class CompleteYourProfileScreen extends StatelessWidget {
  const CompleteYourProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BG_PINK,
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 278/272,
              child: Image.asset(
                Images.COUPLE_HEART
              ),
            ),

            Text(
              'Complete your profile to get\nmore matches!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: CFontFamily.MEDIUM
              ),
            ),

            SizedBox(height: Get.height * .15,),
            MainButton(
              onPress: (){
                Get.to(()=>ProfileQuestionsScreen());
              },
              label: 'Complete profile'
            ),

            TextButton(
              onPressed: (){
                Get.offAll(()=>Home());
              },
              child: Text(
                'Maybe later',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: CFontFamily.REGULAR,
                  color: AppColor.TEXT_COLOR
                ),
              )
            )
          ],
        )
      )
    );
  }
}
