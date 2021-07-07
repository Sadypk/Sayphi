import 'package:sayphi/authentication/repository/authRepo.dart';
import 'package:sayphi/features/homeScreen/model/matchedUserModel.dart';
import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/mutations.dart';
import 'package:sayphi/mainApp/config/graphql/queries.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/model/apiResponse.dart';
import 'package:sayphi/mainApp/model/otherUserModel.dart';
import 'package:sayphi/user/model/promptModel.dart';
import 'package:sayphi/user/model/userModel.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class UserRepo{
  static Future<bool> updateProfile({
    String? firstname,
    String? lastname,
    String?  genderId,
    bool? showGender,
    String? dob,
    String? nickName,
    String? userEthnicityID,
    String? profileImage,
    bool? isComplete,
    LocationModel? userLocation,
    LocationModel? filterLocation,
    String? interestedIn,
    String? filterBy,
    int? ageRangeStart,
    int? ageRangeEnd,
    String? language,
    String? lookingFor,
    bool? photoVerified,
    int? heightRangeStart,
    int? heightRangeEnd,
    int? childrenRangeStart,
    int? childrenRangeEnd,
    int? userHeight,
    bool? smoking,
    bool? pets,
    String? filterReligion,
    String? userReligion,
    String? password,
    String? filterEthnicity,
    String? questionID,
    String? questionAnswer,
    String? school,
    String? college,
    String? occupation,
    String? instaId,
    String? spotifyId,
    String? relationGoal,
    String? relationStatus,
    String? status,
}) async{

    Map<String, dynamic> variables = {};

    /// PROFILE
    if(firstname !=null) variables.putIfAbsent('firstname', () => firstname);
    if(lastname !=null) variables.putIfAbsent('lastname', () => lastname);
    if(genderId !=null) variables.putIfAbsent('genderId', () => genderId);
    if(showGender !=null) variables.putIfAbsent('showGender', () => showGender);
    if(dob !=null) variables.putIfAbsent('dob', () => dob);
    if(nickName !=null) variables.putIfAbsent('nickName', () => nickName);
    if(userEthnicityID !=null) variables.putIfAbsent('userEthnicityID', () => userEthnicityID);
    if(profileImage !=null) variables.putIfAbsent('profileImage', () => profileImage);
    if(isComplete !=null) variables.putIfAbsent('isComplete', () => isComplete);
    if(password !=null) variables.putIfAbsent('password', () => password);
    if(userReligion !=null) variables.putIfAbsent('userReligion', () => userReligion);
    if(userHeight !=null) variables.putIfAbsent('userHeight', () => userHeight);
    if(school !=null) variables.putIfAbsent('school', () => school);
    if(college !=null) variables.putIfAbsent('college', () => college);
    if(occupation !=null) variables.putIfAbsent('occupation', () => occupation);
    if(relationGoal !=null) variables.putIfAbsent('relationshipGoal', () => relationGoal);
    if(relationStatus !=null) variables.putIfAbsent('relationshipStatus', () => relationStatus);
    if(instaId !=null) variables.putIfAbsent('instaId', () => instaId);
    if(spotifyId !=null) variables.putIfAbsent('spotifyId', () => spotifyId);
    if(status !=null) variables.putIfAbsent('status', () => status);
    if(userLocation !=null) variables.putIfAbsent('userLocaion', () => userLocation);

    /// FILTER
    if(filterLocation !=null) variables.putIfAbsent('filterLocation', () => filterLocation);
    if(interestedIn !=null) variables.putIfAbsent('interestedIn', () => interestedIn);
    if(filterBy !=null) variables.putIfAbsent('filterBy', () => filterBy);
    if(ageRangeStart !=null) variables.putIfAbsent('ageRangeStart', () => ageRangeStart);
    if(ageRangeEnd !=null) variables.putIfAbsent('ageRangeEnd', () => ageRangeEnd);
    if(language !=null) variables.putIfAbsent('language', () => language);
    if(lookingFor !=null) variables.putIfAbsent('lookingFor', () => lookingFor);
    if(photoVerified !=null) variables.putIfAbsent('photoVerified', () => photoVerified);
    if(heightRangeStart !=null) variables.putIfAbsent('heightStart', () => heightRangeStart);
    if(heightRangeEnd !=null) variables.putIfAbsent('heightEnd', () => heightRangeEnd);
    if(childrenRangeStart !=null) variables.putIfAbsent('childrenStart', () => childrenRangeStart);
    if(childrenRangeEnd !=null) variables.putIfAbsent('childrenEnd', () => childrenRangeEnd);
    if(smoking !=null) variables.putIfAbsent('smoking', () => smoking);
    if(pets !=null) variables.putIfAbsent('pets', () => pets);
    if(filterReligion !=null) variables.putIfAbsent('filterReligion', () => filterReligion);
    if(filterEthnicity !=null) variables.putIfAbsent('filterEthnicity', () => filterEthnicity);


    /// question answer
    if(questionID !=null) variables.putIfAbsent('questionID', () => questionID);
    if(questionAnswer !=null) variables.putIfAbsent('questionAnswer', () => questionAnswer);

    ApiResponse _response = await Api.mutate(
      mutationName: GMutation.UPDATE_USER_NAME,
      mutation: GMutation.UPDATE_USER,
      variables: variables,
      auth: true
    );

    /// updating user profile by verifying the token
    AuthRepo.verifyToken(UserViewModel.userToken);

    return _response.error;
  }

  static Future<List<UserPromptModel>> getAllPrompts() async{
    ApiResponse _response = await Api.query(
        queryName: GQueries.GET_ALL_USER_PROMPTS_NAME,
        query: GQueries.GET_ALL_USER_PROMPTS,
        auth: true
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((prompt) => UserPromptModel.fromJson(prompt)));
    }
  }

  static Future<void> addPrompt(String id, String text) async{

    final variables = {
      'id' : id,
      'answer' : text
    };

    ApiResponse _response = await Api.mutate(
        mutationName: GMutation.USER_ADD_PROMPT_NAME,
        mutation: GMutation.USER_ADD_PROMPT,
        variables: variables,
        auth: true
    );

    if(!_response.error){
      Snack.top(title: 'Prompt Added',message: 'Others can view it now');
      /// updating user profile by verifying the token
      AuthRepo.verifyToken(UserViewModel.userToken);
    }


  }

  static Future<void> deletePrompt(String id) async{
    final variables = {
      'id' : id
    };

    ApiResponse _response = await Api.mutate(
        mutationName: GMutation.USER_DELETE_PROMPT_NAME,
        mutation: GMutation.USER_DELETE_PROMPT,
        variables: variables,
        auth: true
    );

    if(!_response.error){
      Snack.top(title: 'Prompt Deleted',message: '');
      /// updating user profile by verifying the token
      AuthRepo.verifyToken(UserViewModel.userToken);
    }
  }

  static Future<void> updatePrompt(String id, String text) async{
    final variables = {
      'id' : id,
      'answer' : text
    };

    ApiResponse _response = await Api.mutate(
        mutationName: GMutation.USER_UPDATE_PROMPT_NAME,
        mutation: GMutation.USER_UPDATE_PROMPT,
        variables: variables,
        auth: true
    );

    if(!_response.error){
      Snack.top(title: 'Prompt Updated',message: 'Others can see it now');
      /// updating user profile by verifying the token
      AuthRepo.verifyToken(UserViewModel.userToken);
    }
  }

  static Future<void> addImage(String link) async{
    final variables = {
      'link' : link
    };

    ApiResponse _response = await Api.mutate(
        mutationName: GMutation.USER_ADD_IMAGE_NAME,
        mutation: GMutation.USER_ADD_IMAGE,
        variables: variables,
        auth: true
    );

    if(!_response.error){
      Snack.top(title: 'Image uploaded',message: 'Others can see it now');
      /// updating user profile by verifying the token
      AuthRepo.verifyToken(UserViewModel.userToken);
    }
  }

  static Future<List<OtherUserModel>> getFollowers() async{

    final _response = await Api.query(
      queryName: GQueries.USER_FOLLOWERS_NAME,
      query: GQueries.USER_FOLLOWERS,
      auth: true
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((user) => OtherUserModel.fromJson(user)));
    }

  }

  static Future<List<OtherUserModel>> getFollowings() async{

    final _response = await Api.query(
      queryName: GQueries.USER_FOLLOWING_NAME,
      query: GQueries.USER_FOLLOWING,
      auth: true
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((user) => OtherUserModel.fromJson(user)));
    }

  }


  // TODO like user api
  static Future<void> likeUnLikeUser(String userId) async{
    await Api.mutate(
      mutationName: GMutation.LIKE_USER_NAME,
      mutation: GMutation.LIKE_USER,
      auth: true,
      variables: {
        'userId' : userId
      }
    );
  }

  // TODO follow user api
  static Future<void> followUnFollowUser(String userId) async{
    await Api.mutate(
      mutationName: GMutation.FOLLOW_USER_NAME,
      mutation: GMutation.FOLLOW_USER,
      auth: true,
      variables: {
        'userId' : userId
      }
    );
  }

  // TODO block user api
  static Future<void> blockUnBlockUser(String userId) async{
    await Api.mutate(
      mutationName: GMutation.BLOCK_UNBLOCK_USER_NAME,
      mutation: GMutation.BLOCK_UNBLOCK_USER,
      auth: true,
      variables: {
        'userID' : userId
      }
    );
  }

  // TODO visit user api
  static Future<void> visitUser(String userId) async{
    await Api.mutate(
        mutationName: GMutation.VISIT_USER_NAME,
        mutation: GMutation.VISIT_USER,
        auth: true,
        variables: {
          'userID' : userId
        }
    );
  }

  static Future<List<OtherUserModel>> getUserLikes() async{

    final _response = await Api.query(
      queryName: GQueries.USER_LIKES_NAME,
      query: GQueries.USER_LIKES,
      auth: true
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((user) => OtherUserModel.fromJson(user)));
    }

  }

  static Future<List<OtherUserModel>> getUserLikers() async{

    final _response = await Api.query(
      queryName: GQueries.USER_LIKERS_NAME,
      query: GQueries.USER_LIKERS,
      auth: true
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((user) => OtherUserModel.fromJson(user)));
    }

  }

  static Future<List<OtherUserModel>> getBlockedUsers() async{

    final _response = await Api.query(
        queryName: GQueries.BLOCKED_USERS_NAME,
        query: GQueries.BLOCKED_USERS,
        auth: true
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((user) => OtherUserModel.fromJson(user)));
    }

  }

  static Future<List<OtherUserModel>> getUserVisitors() async{

    final _response = await Api.query(
      queryName: GQueries.USER_VISITORS_NAME,
      query: GQueries.USER_VISITORS,
      auth: true
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((user) => OtherUserModel.fromJson(user)));
    }

  }

  static Future<List<MinimalUserModel>> getTopRankedUsers() async{

    final _response = await Api.query(
      queryName: GQueries.TOP_RANKED_USERS_NAME,
      query: GQueries.TOP_RANKED_USERS,
      auth: true
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((user) => MinimalUserModel.fromJson(user)));
    }

  }

  static Future<void> addVideo(String link) async{
    final variables = {
      'videoLink' : link
    };

    ApiResponse _response = await Api.mutate(
        mutationName: GMutation.ADD_VIDEO_PROFILE_NAME,
        mutation: GMutation.ADD_VIDEO_PROFILE,
        variables: variables,
        auth: true
    );

    if(!_response.error){
      Snack.top(title: 'Video uploaded',message: 'Others can see it now');
      /// updating user profile by verifying the token
      AuthRepo.verifyToken(UserViewModel.userToken);
    }
  }
}