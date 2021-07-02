import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/features/dayStory/view/wdigets/userDayAvatar.dart';
import 'package:sayphi/features/dayStory/view_model/dayViewModel.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

import '../52_storyViewScreen.dart';

class HomeScreenDayBar extends StatelessWidget {
  const HomeScreenDayBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      height: Get.height * .12,
      margin: EdgeInsets.only(left: 20, right: 20, top: 12),
      child: Row(
        children: [

          Obx((){
            String imageLink = UserViewModel.user.value.profileImage ?? Demo.PROFILE_IMAGE;

            if(DayViewModel.userDay.length > 0){

              print(DayViewModel.userDay.length);

              imageLink = DayViewModel.userDay.last.image;
            }

            return UserDayAvatar(imageLink: imageLink, name: 'Your story', isOwn: true);
          }),

          Obx((){

            final data = DayViewModel.allDay;

            return data.length > 0 ? Expanded(
              child: InkWell(
                onTap: (){
                  Get.to(()=>SeeStoryView());
                },
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: data.length,
                  itemBuilder: (_, index) {

                    final _day = data[index];

                    return UserDayAvatar(
                      index: index,
                      imageLink: _day.day.last.image,
                      name: _day.name.length > 7 ? _day.name.substring(0,7) : _day.name,
                    );
                  },
                ),
              ),
            ) : SizedBox();
          })
        ],
      ),
    );
  }
}
