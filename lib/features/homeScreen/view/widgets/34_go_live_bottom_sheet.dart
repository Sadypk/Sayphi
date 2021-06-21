import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/live/view/35_go_live_info_screen.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class GoLiveBottomSheet extends StatelessWidget {
  const GoLiveBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: AppColor.SCAFFOLD_BG_PINK
      ),
      padding: EdgeInsets.symmetric(horizontal: Get.width * .1, vertical: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(
            height: 4,
            width: Get.width * .2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.DARK_GREY
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GoLiveBtn(type: LiveType.AUDIO),
              GoLiveBtn(type: LiveType.VIDEO),
            ],
          ),

          SizedBox(),
        ],
      ),
    );
  }
}

enum LiveType{AUDIO, VIDEO}

class GoLiveBtn extends StatelessWidget {
  final LiveType type;
  const GoLiveBtn({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _isAudio = type == LiveType.AUDIO;


    return InkWell(
      onTap: (){
        Get.to(()=>GoLiveInfoScreen());
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.PRIMARY,width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Icon(
              _isAudio ? Icons.multitrack_audio_rounded : Icons.videocam_rounded,
              color: AppColor.PRIMARY,
              size: 30,
            ),

            Text(
              'Go to live',
              style: TextStyle(
                fontSize: 16,
                color: AppColor.TEXT_LIGHT
              ),
            ),

            Text(
              _isAudio ? 'Audio' : 'Video',
              style: TextStyle(
                fontSize: 24,
                fontFamily: CFontFamily.MEDIUM
              ),
            )

          ],
        ),
      ),
    );
  }
}
