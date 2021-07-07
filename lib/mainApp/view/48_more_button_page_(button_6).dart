import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/dayStory/view/51_view_all_stories.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/mainApp/view/56_top_ranked_people.dart';
import 'package:sayphi/user/view/54_followers.dart';
import 'package:sayphi/user/view/55_my_following.dart';
import 'package:sayphi/user/view/49_smart_picks.dart';
import 'package:sayphi/user/view/blockedPeopleScreen.dart';

import '60_extra_options.dart';
import 'leaglAndPrivacyScreen.dart';

class MoreButtonPage extends StatefulWidget {
  @override
  _MoreButtonPageState createState() => _MoreButtonPageState();
}

class _MoreButtonPageState extends State<MoreButtonPage> {
  @override
  Widget build(BuildContext context) {
    listTile(String label){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 14, color: AppColor.TEXT_COLOR),),
          Divider(height: 30,),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
        title: Text('More options', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontFamily: CFontFamily.REGULAR),),
          centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Get.to(()=> SmartPicksScreen());
              },
              child: listTile('Smart picks')),
            listTile('Daily surprise'),
            GestureDetector(
              onTap: (){
                Get.to(()=>ViewAllStoriesScreen());
              },
              child: listTile('All stories')),
            GestureDetector(
              onTap: (){
                Get.to(()=>FollowersScreen());
              },
              child: listTile('Followers')),
            GestureDetector(
              onTap: (){
                Get.to(()=>FollowingScreen());
              },
              child: listTile('Following')),
            GestureDetector(
              onTap: (){
                Get.to(()=>TopRankedPeopleScreen());
              },
              child: listTile('Top ranked people')),
            listTile('Know me better: Challenge questions'),
            listTile('Notifications'),
            listTile('Transactions'),
            GestureDetector(
              onTap: (){
                Get.to(()=>BlockedPeopleScreen());
              },
              child: listTile('Blocked people')),
            GestureDetector(
              onTap: (){
                Get.to(()=>LegalAndPrivacyScreen());
              },
              child: listTile('Legal/Privacy')),
            GestureDetector(
              onTap: (){
                Get.to(()=>ExtraOptionsScreen());
              },
              child: listTile('Extra')),
          ],
        ),
      ),
    );
  }
}
