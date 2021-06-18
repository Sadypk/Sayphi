import 'package:flutter/material.dart';
import 'package:sayphi/features/chat_menu/view/all_messages.dart';
import 'package:sayphi/features/chat_menu/view_model/chat_head.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';

class ChatMainScreen extends StatelessWidget {
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
                  'Chat',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          Container(
            height: 45,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey),
              color: Colors.grey.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(Icons.search, color: Colors.grey)),
                Flexible(
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration.collapsed(
                        hintText: 'Search matches', hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey)),
                  ),
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
                Text(
                  'New matches',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return ChatHeader();
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(labelColor: Colors.black, indicatorColor: AppColor.PRIMARY, tabs: [
                        Tab(
                          text: 'New Messages',
                        ),
                        Tab(
                          text: 'All Messages',
                        ),
                      ]),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 400,
                        child: TabBarView(
                          children: [
                            AllMessages(),
                            AllMessages(),
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
