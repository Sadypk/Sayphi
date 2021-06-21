import 'package:flutter/material.dart';
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/features/chat_messaging/view/widgets/chat_head.dart';

class MessageListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: Demo.DEMO_USERS.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (_, index) => MessageListTile(isRead: index%2 == 0, image: Demo.DEMO_USERS[index])
    );
  }
}

class MessageListTile extends StatelessWidget {
  final bool isRead;
  final String image;
  const MessageListTile({Key? key,
    this.isRead = false,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: ChatHeader(image: image)),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Arya Stark',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: CFontFamily.MEDIUM
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Fear cuts deeper than swords',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: CFontFamily.MEDIUM,
                    color: isRead ? AppColor.TEXT_LIGHT : AppColor.TEXT_COLOR
                  )
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '18:31',
                  style: TextStyle(fontSize: 12, fontFamily: CFontFamily.MEDIUM),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Positioned(
                      top: -1,
                      right: 4,
                      child: Icon(
                        Icons.check,
                        color: AppColor.PRIMARY,
                      ),
                    ),
                    Icon(
                      Icons.check,
                      color: AppColor.PRIMARY,
                    )
                  ],
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}

