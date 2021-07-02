import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/dayStory/view/71_addStory.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

import '../52_storyViewScreen.dart';

class UserDayAvatar extends StatelessWidget {
  final String imageLink;
  final String name;
  final bool isOwn;
  final bool isWatched;
  final bool userOnline;
  final int? index;

  const UserDayAvatar({Key? key,
    required this.imageLink,
    required this.name,
    this.index,
    this.isOwn = false,
    this.isWatched = false,
    this.userOnline = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: (){
          if(isOwn){
            Get.to(()=> AddDayStoryScreen());
          }else{
            Get.to(()=>SeeStoryView(storyIndex: index));
          }
        },
        child: Stack(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundColor: isWatched ? Colors.transparent : AppColor.PRIMARY,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: CachedNetworkImageProvider(imageLink),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                    isOwn ? 'Your Story' : name
                )
              ],
            ),
            if(isOwn)Positioned(
              bottom: 24,
              right: 0,
              child: Icon(
                Icons.add_circle_rounded,
                color: AppColor.PRIMARY,
                size: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}