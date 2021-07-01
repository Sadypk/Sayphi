import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/mutations.dart';

class VideoLiveRepo{

  static Future<String> createChannel(String channelName) async{

    final _response = await Api.mutate(
      queryName: GMutation.CREATE_CHANNEL_NAME,
      query: GMutation.CREATE_CHANNEL,
      variables: {
        'channelName' : channelName
      }
    );

    return _response.data;

  }

}