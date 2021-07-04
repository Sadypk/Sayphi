import 'package:sayphi/features/live/model/liveUserModel.dart';
import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/mutations.dart';
import 'package:sayphi/mainApp/config/graphql/queries.dart';

class LiveRepo{

  static Future<String> createChannel(String channelName) async{

    final _response = await Api.mutate(
      auth: true,
      queryName: GMutation.CREATE_CHANNEL_NAME,
      query: GMutation.CREATE_CHANNEL,
      variables: {
        'channelName' : channelName
      }
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
}