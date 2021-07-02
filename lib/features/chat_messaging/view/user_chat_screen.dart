import 'package:cached_network_image/cached_network_image.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayphi/features/chat_messaging/repository/chatRepo.dart';
import 'package:sayphi/features/chat_messaging/view_model/chatViewModel.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/mainApp/resources/fontStyle.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class UserChatScreen extends StatefulWidget {


  final String toUserId;
  final String toUserImage;
  final String toUserName;

  const UserChatScreen({Key? key, required this.toUserId, required this.toUserImage, required this.toUserName}) : super(key: key);

  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {

  ChatUser _fromUser = ChatUser(
    uid: UserViewModel.user.value.id,
    name: UserViewModel.user.value.name,
    avatar: UserViewModel.user.value.profileImage
  );

  late ChatUser _toUser;

  @override
  void initState() {
    super.initState();
    _toUser = ChatUser(
      uid: widget.toUserId,
      name: widget.toUserName,
      avatar: widget.toUserImage,
    );

    ChatRepo.getChat(widget.toUserId);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx((){

        List<ChatMessage> _messages = [];

        ChatViewModel.currentChat.forEach((msg) {
          _messages.add(ChatMessage(
            text: msg.message,
            user: msg.fromUser == _toUser.uid ? _fromUser : _toUser,
            createdAt: msg.createdAt
          ));
        });


        _messages.sort((a, b) => a.createdAt.compareTo(b.createdAt));

        return Stack(
          children: [

            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: _toUser.avatar!,
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff141015).withOpacity(.8)
                ),
              ),
            ),


            Theme(
              data: ThemeData(
                  accentColor: AppColor.PRIMARY
              ),
              child: DashChat(
                messages: _messages,
                user: _toUser,
                sendOnEnter: true,
                inputDecoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter Message',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
                onSend: (ChatMessage chatMessage) => ChatRepo.sendMessage(chatMessage.text!, _toUser)
              ),
            ),

            Positioned(
              left: 20,
              top: 12,
              child: SafeArea(
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: CachedNetworkImageProvider(
                    _toUser.avatar!
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
