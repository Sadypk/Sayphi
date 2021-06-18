import 'package:flutter/material.dart';
import 'package:sayphi/features/chat_menu/view/all_messages.dart';
import 'package:sayphi/features/chat_menu/view_model/chat_head.dart';
import 'package:sayphi/features/live/view_model/live_video.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class LiveScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 3), child: Icon(Icons.arrow_back_ios, color: Colors.grey)),
                Text(
                  'Live',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(labelColor: Colors.black, indicatorColor: AppColor.PRIMARY, tabs: [
                        Tab(
                          text: 'Live video',
                        ),
                        Tab(
                          text: 'Live audio',
                        ),
                      ]),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 560,
                        child: TabBarView(
                          children: [
                            LiveVideo(),
                            LiveVideo(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
