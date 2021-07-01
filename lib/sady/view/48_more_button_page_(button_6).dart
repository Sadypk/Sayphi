import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/view/49_smart_picks.dart';

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
            listTile('All stories'),
            listTile('Followers'),
            listTile('My favorite'),
            listTile('Top ranked people'),
            listTile('Know me better: Challenge questions'),
            listTile('Notifications'),
            listTile('Transactions'),
            listTile('Blocked people'),
            listTile('Legal/Privacy'),
            listTile('Extra'),
          ],
        ),
      ),
    );
  }
}
