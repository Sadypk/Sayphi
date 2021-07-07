import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sayphi/features/agora_streaming/view/boradcastPage.dart';
import 'package:sayphi/features/chat_messaging/model/messagModel.dart';
import 'package:sayphi/features/live/model/liveUserModel.dart';
import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/mutations.dart';
import 'package:sayphi/mainApp/config/graphql/queries.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class LiveRepo{
  static final _videoLiveInstance = FirebaseFirestore.instance.collection('LIVE_VIDEO_CHAT');

  static Future<String> createChannel(String channelName,[bool? isVideo]) async{


    Map<String, dynamic> params = {
      'channelName' : channelName
    };

    if(isVideo != null){
      if(isVideo){
        params.putIfAbsent('isVideo', () => true);
      }else{
        params.putIfAbsent('isAudio', () => true);
      }
    }

    final _response = await Api.mutate(
      auth: true,
      mutationName: GMutation.CREATE_CHANNEL_NAME,
      mutation: GMutation.CREATE_CHANNEL,
      variables: params
    );

    return _response.data;

  }


  static Future<List<LiveUserModel>> getVideoLiveUsers() async{
    final _response = await Api.query(
      queryName: GQueries.GET_LIVE_VIDEO_USERS_NAME,
      query: GQueries.GET_LIVE_VIDEO_USERS,
      auth: true,
      showLoad: false,
    );

    if(_response.error) {
      return [];
    }else{
      return List.from(_response.data.map((user) => LiveUserModel.fromJson(user)));
    }
  }

  static Future<List<LiveUserModel>> getAudioLiveUsers() async{
    final _response = await Api.query(
      queryName: GQueries.GET_LIVE_AUDIO_USERS_NAME,
      query: GQueries.GET_LIVE_AUDIO_USERS,
      auth: true,
      showLoad: false,
    );

    if(_response.error) {
      return [];
    }else{
      return List.from(_response.data.map((user) => LiveUserModel.fromJson(user)));
    }
  }

  static Future<void> increaseViewCount(String channelName)async {
    await _videoLiveInstance.doc(channelName).update({
      'viewer' : FieldValue.increment(1)
    });
  }

  static void getLiveVideoChat(String channelName){
    _videoLiveInstance.doc(channelName).snapshots().listen((event) {
      final data = event.data()!;

      print(event.data());

      BroadcastPage.viewer.value = data['viewer'] ?? 0;
      BroadcastPage.chat.value = List.from(data['chat'].map((msg) => MessageModel.fromJson(msg)));

    });
  }

  static Future<void> createChat(String channelName) async{
    await _videoLiveInstance.doc(channelName).set({
      'viewer' : 0,
      'chat' : []
    });
  }


  static void sendMessage(String channelName, String message) async{

    await _videoLiveInstance.doc(channelName).update({
      'chat' : FieldValue.arrayUnion([{
        'fromUser' : UserViewModel.user.value.name,
        'toUser' : UserViewModel.user.value.id,
        'toUserImage' : UserViewModel.user.value.profileImage,
        'message' : message,
        'toUserName' : channelName,
        'createdAt' : new DateTime.now().millisecondsSinceEpoch
      }])
    });
  }

  static void closeChannel(bool isVideo) {
    Api.mutate(
      mutationName: GMutation.CLOSE_LIVE_NAME,
      mutation: GMutation.CLOSE_LIVE,
      auth: true,
      variables: {
        'closeLiveVideo' : isVideo,
        'closeLiveAudio' : !isVideo
      }
    );
  }
}