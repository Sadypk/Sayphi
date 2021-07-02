import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/chat_messaging/model/messagModel.dart';
import 'package:sayphi/features/chat_messaging/view/user_chat_screen.dart';
import 'package:sayphi/features/chat_messaging/view_model/chatViewModel.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/features/chat_messaging/view/widgets/chat_head.dart';

class MessageListView extends StatelessWidget {

  final List<List<MessageModel>> messageList;
  const MessageListView({required this.messageList});

  @override
  Widget build(BuildContext context) {
    return messageList.length > 0 ? ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: messageList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (_, index) => MessageListTile(messages: messageList[index])
    ) : Center(child: Text('No Chat Found'));
  }
}

class MessageListTile extends StatelessWidget {
  final List<MessageModel> messages;
  const MessageListTile({Key? key,
    required this.messages
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    messages.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    final lastMessage = messages.last;
    return InkWell(
      onTap: (){

        ChatViewModel.currentChat.value = messages;

        Get.to(()=> UserChatScreen(toUserId: lastMessage.toUserId, toUserImage: lastMessage.toUserImage, toUserName: lastMessage.toUserName));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: ChatHeader(image: lastMessage.toUserImage)),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    lastMessage.toUserName,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: CFontFamily.MEDIUM
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    lastMessage.message,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: CFontFamily.MEDIUM,
                      color: AppColor.TEXT_LIGHT
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
                    DateFormat('hh: MM').format(lastMessage.createdAt),
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
      ),
    );
  }
}

