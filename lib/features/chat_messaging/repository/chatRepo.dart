import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:sayphi/features/chat_messaging/model/messagModel.dart';
import 'package:sayphi/features/chat_messaging/view_model/chatViewModel.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class ChatRepo{


  static void init(){
    _getAllMessages();
  }

  static final _instance = FirebaseFirestore.instance.collection('CHAT_MESSAGES');

  static Future<void> sendMessage(String message, ChatUser toUser) async{

    await _instance.add({
      'fromUser' : UserViewModel.user.value.id,
      'toUser' : toUser.uid,
      'toUserImage' : toUser.avatar,
      'message' : message,
      'toUserName' : toUser.name,
      'createdAt' : new DateTime.now().millisecondsSinceEpoch
    });


  }

  static void _getAllMessages() async{

    final _userID = UserViewModel.user.value.id;

    _instance.snapshots().listen((event) {
      ChatViewModel.allChat.clear();
      event.docs.forEach((element) {
        final _message = MessageModel.fromJson(element.data());

        if(_message.toUserId == _userID || _message.fromUser == _userID){
          ChatViewModel.allChat.add(_message);
        }

      });


    });

  }

  static void getChat(String toUserId) {


    final _userID = UserViewModel.user.value.id;

    _instance.snapshots().listen((event) {
      ChatViewModel.currentChat.clear();
      event.docs.forEach((element) {
        final _message = MessageModel.fromJson(element.data());

        if(_message.toUserId == toUserId && _message.fromUser == _userID){
          ChatViewModel.currentChat.add(_message);
        }else if(_message.toUserId == _userID && _message.fromUser == toUserId){
          ChatViewModel.currentChat.add(_message);
        }

      });


    });

  }

}