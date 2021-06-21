import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

import '16_complete_your_profile.dart';

class TermsAndConditionAgreementScreen extends StatelessWidget {
  const TermsAndConditionAgreementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.SCAFFOLD_BG_PINK,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'We value your privacy',
            style: TextStyle(
              color: AppColor.TEXT_COLOR,
              fontFamily: CFontFamily.MEDIUM
            ),
          ),
          actions: [
            TextButton(
                onPressed: (){},
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: AppColor.TEXT_COLOR
                  ),
                )
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please read carefully our terms and conditions',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: CFontFamily.MEDIUM
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard.',
                    style: TextStyle(
                      fontFamily: CFontFamily.REGULAR,
                      color: AppColor.TEXT_LIGHT,
                      height: 1.4
                    ),
                  ),

                  /// basic info`s suggestions about image uploads
                  SizedBox(height: 20),

                  TermsWidget(
                    title: 'Be yourself',
                    subTitle: 'Contrary to popular belief, Lorem Ipsum is not simply random text.',
                  ),
                  TermsWidget(
                    title: 'Stay safe',
                    subTitle: 'Contrary to popular belief, Lorem Ipsum is not simply random text.',
                  ),
                  TermsWidget(
                    title: 'Respect people',
                    subTitle: 'Contrary to popular belief, Lorem Ipsum is not simply random text.',
                  ),


                  SizedBox(height: 20),
                  Text(
                    'Sayphie and our partners use technologies such as device recognition to store or access information on your device., and to process personal information such as gender and age',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontFamily: CFontFamily.MEDIUM,
                      fontSize: 16,
                      height: 1.4
                    ),
                  ),
                  Spacer(),
                  MainButton(
                    onPress: (){
                      Get.to(()=>CompleteYourProfileScreen());
                    },
                    label: 'Agree and Continue'
                  ),
                  SizedBox(height: 20),
                  MainButton(
                    onPress: (){},
                    btnColor: AppColor.PRIMARY_DARK,
                    label: 'Cancel',
                    labelColor: Colors.white,
                  ),
                ]
            )
        )
    );
  }
}

class TermsWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const TermsWidget({Key? key, required this.title, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle,
            color: AppColor.PRIMARY,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: CFontFamily.MEDIUM
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontFamily: CFontFamily.REGULAR,
                    color: AppColor.TEXT_LIGHT
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
