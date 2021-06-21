import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/view/15_terms_and_condition_screen.dart';

class GoLiveInfoScreen extends StatelessWidget {
  const GoLiveInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.SCAFFOLD_BG_PINK,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Go to live',
            style: TextStyle(
                color: AppColor.TEXT_COLOR,
                fontFamily: CFontFamily.MEDIUM
            )
          )
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Let\'s get live streaming',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: CFontFamily.MEDIUM
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard.',
                    textAlign: TextAlign.justify,
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
                    onPress: (){},
                    label: 'Start Stream'
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
