import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/mutations.dart';
import 'package:sayphi/mainApp/model/apiResponse.dart';

class UserRepo{
  static Future<bool> updateProfile({
    String? firstname,
    String? lastname,
    String?  genderId,
    bool? showGender,
    String? name,
    String? dob,
    String? nickName,
    String? ethnicityId,
    String? profileImage,
    bool? isComplete,
    String? userLocationName,
    double? latitude,
    double? longitude,
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
    bool? smoking,
    bool? pets,
    String? religionId
}) async{

    Map<String, dynamic> variables = {};

    /// PROFILE
    if(firstname !=null) variables.putIfAbsent('firstname', () => firstname);
    if(lastname !=null) variables.putIfAbsent('lastname', () => lastname);
    if(genderId !=null) variables.putIfAbsent('genderId', () => genderId);
    if(showGender !=null) variables.putIfAbsent('showGender', () => showGender);
    if(name !=null) variables.putIfAbsent('name', () => name);
    if(dob !=null) variables.putIfAbsent('dob', () => dob);
    if(nickName !=null) variables.putIfAbsent('nickName', () => nickName);
    if(ethnicityId !=null) variables.putIfAbsent('ethnicityID', () => ethnicityId);
    if(profileImage !=null) variables.putIfAbsent('profileImage', () => profileImage);
    if(isComplete !=null) variables.putIfAbsent('isComplete', () => isComplete);

    /// FILTER
    if(userLocationName !=null) variables.putIfAbsent('locationName', () => userLocationName);
    if(latitude !=null) variables.putIfAbsent('latitude', () => latitude);
    if(longitude !=null) variables.putIfAbsent('longitude', () => longitude);
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
    if(religionId !=null) variables.putIfAbsent('religion', () => religionId);

    ApiResponse _response = await Api.mutate(
      queryName: GMutation.UPDATE_USER_NAME,
      query: GMutation.UPDATE_USER,
      variables: variables,
      auth: true
    );

    return _response.error;
  }
}