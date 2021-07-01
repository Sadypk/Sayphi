import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:sayphi/demo_files.dart';
import 'package:sayphi/features/chat_messaging/repository/chatRepo.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class UserChatScreen extends StatefulWidget {


  final String toUser;
  final String toUserImage;

  const UserChatScreen({Key? key, required this.toUser, required this.toUserImage}) : super(key: key);

  @override
  _UserChatScreenState createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {

  late types.User _user;

  @override
  void initState() {
    super.initState();

    final appUser = UserViewModel.user.value;

    _user = types.User(
      id: appUser.id,
      firstName: appUser.name,
      imageUrl: appUser.profileImage ?? Demo.PROFILE_IMAGE,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Chat(
        user: _user,
        messages: [],
        onSendPressed: (message) => ChatRepo.sendMessage(message.text, widget.toUser),
      ),
    );
  }
}
