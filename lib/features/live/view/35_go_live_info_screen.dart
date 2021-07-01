import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/homeScreen/view/widgets/34_go_live_bottom_sheet.dart';
import 'package:sayphi/features/live/view/40_create_audio_room_screen.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/view_model/appViewModel.dart';
import 'package:sayphi/user/view/15_terms_and_condition_screen.dart';

class GoLiveInfoScreen extends StatelessWidget {
  final LiveType liveType;
  const GoLiveInfoScreen({Key? key, required this.liveType}) : super(key: key);

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
                    AppViewModel.streamingConditions.header,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: CFontFamily.REGULAR,
                      color: AppColor.TEXT_LIGHT,
                      height: 1.4
                    ),
                  ),

                  /// basic info`s suggestions about image uploads
                  SizedBox(height: 20),


                  Wrap(
                      children: AppViewModel.streamingConditions.policies.map((e) => TermsWidget(title: e.title, subTitle: e.description)).toList()
                  ),


                  SizedBox(height: 20),
                  Text(
                    AppViewModel.streamingConditions.footer,
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

                      if(liveType == LiveType.AUDIO){
                        /// closing the consent screen
                        Get.off(()=>CreateAudioRoomScreen());
                      }

                    },
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
