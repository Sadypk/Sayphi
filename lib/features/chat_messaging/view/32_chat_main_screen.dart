import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/features/chat_messaging/view/widgets/chat_head.dart';

import '../../../demo_files.dart';
import 'widgets/messageListView.dart';

class ChatMainScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    _buildSearchMatchesTextField(){
      return Container(
        height: 45,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Row(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 5), child: Icon(Icons.search, color: Colors.grey)),
            Flexible(
              child: TextField(
                controller: searchController,
                decoration: InputDecoration.collapsed(
                    hintText: 'Search matches', hintStyle: TextStyle(fontSize: 16, fontFamily: CFontFamily.REGULAR, color: AppColor.DARK_GREY)),
              ),
            )
          ],
        ),
      );
    }

    _buildNewMatches(){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
            child: Text(
              'New matches',
              style: TextStyle(
                fontSize: 16,
                fontFamily: CFontFamily.REGULAR
              ),
            ),
          ),
          Container(
            height: 60,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 20),
              itemCount: Demo.DEMO_USERS.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return ChatHeader(image: Demo.DEMO_USERS[index], isActive: index%2==0);
              },
            ),
          ),
        ],
      );
    }

    _buildChatList(){
      return Expanded(
        child: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 8,left: 20,right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
                  labelColor: AppColor.TEXT_COLOR,
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontFamily: CFontFamily.REGULAR
                  ),
                  indicatorColor: AppColor.PRIMARY,
                  indicatorWeight: 4,
                  tabs: [
                    Tab(
                      text: 'New Messages',
                    ),
                    Tab(
                      text: 'All Messages',
                    ),
                  ]
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      MessageListView(),
                      MessageListView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        SizedBox(height: 12),

        _buildSearchMatchesTextField(),

        _buildNewMatches(),

        _buildChatList(),

      ],
    );
  }
}
