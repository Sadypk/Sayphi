import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/view_model/appViewModel.dart';
import 'package:sayphi/user/view/15_terms_and_condition_screen.dart';

class LegalAndPrivacyScreen extends StatelessWidget {
  const LegalAndPrivacyScreen({Key? key}) : super(key: key);

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
          )
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please read carefully our Leagal And Privacy',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: CFontFamily.MEDIUM
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    AppViewModel.legalAndPrivacy.header,
                    style: TextStyle(
                        fontFamily: CFontFamily.REGULAR,
                        color: AppColor.TEXT_LIGHT,
                        height: 1.4
                    ),
                  ),

                  /// basic info`s suggestions about image uploads
                  SizedBox(height: 20),

                  Wrap(
                      children: AppViewModel.legalAndPrivacy.policies.map((e) => TermsWidget(title: e.title, subTitle: e.description)).toList()
                  ),


                  SizedBox(height: 20),
                  Text(
                    AppViewModel.legalAndPrivacy.footer,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontFamily: CFontFamily.MEDIUM,
                        fontSize: 16,
                        height: 1.4
                    ),
                  )
                ]
            )
        )
    );
  }
}
