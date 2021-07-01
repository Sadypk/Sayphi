import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';


class ChatRepo{

  static final _instance = FirebaseFirestore.instance.collection('CHAT_MESSAGES');

  static Future<void> sendMessage(String message, String toUser) async{

    _instance.add({
      'fromUser' : UserViewModel.user.value.id,
      'toUser' : UserViewModel.user.value.id,
      'message' : message,
      'createdAt' : DateTime.now().millisecondsSinceEpoch
    });


  }

}