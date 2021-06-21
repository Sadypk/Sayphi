import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/features/chat_messaging/view/widgets/chat_head.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';

class LikesListScreen extends StatelessWidget {
  const LikesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,top: 12),
      child: ListView(
        children: [
          LikesInfoHorizontalList(title: 'My likes'),
          LikesInfoHorizontalList(title: 'Who liked me'),
          LikesInfoHorizontalList(title: 'Who visited me'),
          LikesInfoHorizontalList(title: 'My Matches'),
          LikesInfoHorizontalList(title: 'Who sent credits/ gifts'),
        ],
      ),
    );
  }
}

class LikesInfoHorizontalList extends StatelessWidget {
  final String title;
  const LikesInfoHorizontalList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: CFontFamily.MEDIUM
            ),
          ),
          SizedBox(height: 12),

          SizedBox(
            height: Get.height * .1,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: Demo.DEMO_USERS.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return ChatHeader(image: Demo.DEMO_USERS[index], isActive: index%2==0);
              },
            ),
          )
        ],
      ),
    );
  }
}
