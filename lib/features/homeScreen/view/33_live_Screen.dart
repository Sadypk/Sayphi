import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/homeScreen/view/widgets/34_go_live_bottom_sheet.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/features/homeScreen/view/widgets/live_users_grid.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              labelColor: AppColor.TEXT_COLOR,
              labelStyle: TextStyle(
                fontSize: 16,
                fontFamily: CFontFamily.MEDIUM
              ),
              indicatorColor: AppColor.PRIMARY,
              tabs: [
                Tab(
                  text: 'Live video',
                ),
                Tab(
                  text: 'Live audio',
                ),
              ]
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Stack(
                children: [
                  TabBarView(
                    children: [
                      LiveUserGrid(),
                      LiveUserGrid(),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: MainButton(
                      onPress: (){
                        Get.bottomSheet(GoLiveBottomSheet());
                      },
                      label: 'Go live',
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
