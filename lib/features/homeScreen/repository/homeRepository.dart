import 'package:dash_chat/dash_chat.dart';
import 'package:sayphi/features/chat_messaging/repository/chatRepo.dart';
import 'package:sayphi/features/homeScreen/model/matchedUserModel.dart';
import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/mutations.dart';
import 'package:sayphi/mainApp/config/graphql/queries.dart';
import 'package:sayphi/mainApp/model/otherUserModel.dart';
import 'package:sayphi/user/model/userModel.dart';

class HomeRepo{
  static Future<List<MinimalUserModel>> getMatchingUsers() async{
    final _res = await Api.query(
      queryName: GQueries.MATCHED_USERS_NAME,
      query: GQueries.MATCHED_USERS,
      auth: true
    );

    if(_res.error){
      return [];
    }else{
      return [];
      // return List.from(_res.data.map((match) => MinimalUserModel.fromJson(match)));
    }
  }

  static Future<List<MinimalUserModel>> getMatchedUsers() async{
    final _res = await Api.query(
      queryName: GQueries.GET_MATCHED_USERS_NAME,
      query: GQueries.GET_MATCHED_USERS,
      auth: true
    );

    if(_res.error){
      return [];
    }else{
      return List.from(_res.data.map((match) => MinimalUserModel.fromJson(match)));
    }
  }


  static Future<void> matchUnMatchUser(String userId, bool isMatch) async{
    final _res = await Api.mutate(
      auth: true,
      mutationName: GMutation.MATCH_UNMATCH_USER_NAME,
      mutation: GMutation.MATCH_UNMATCH_USER,
      variables: {
        'userID' : userId,
        'match' : isMatch,
      },
      showLoad: false
    );

    if(!_res.error){
      if(_res.data != null){

        final _toUser = OtherUserModel.fromJson(_res.data);

        ChatRepo.sendMessage(
          '',
          ChatUser(
            name: _toUser.name,
            avatar: _toUser.image,
            uid: _toUser.id
          )
        );
      }
    }

  }

  static Future<UserModel> getUserProfile(String userId) async{
    final _res = await Api.query(
      auth: true,
      queryName: GQueries.GET_USER_PROFILE_NAME,
      query: GQueries.GET_USER_PROFILE,
      variables: {
        'userId' : userId
      }
    );

    return UserModel.fromJson(_res.data);
  }
}