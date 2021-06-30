import 'package:get/get.dart';
import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/queries.dart';
import 'package:sayphi/mainApp/model/apiResponse.dart';
import 'package:sayphi/mainApp/util/localStorage.dart';
import 'package:sayphi/mainApp/view/home.dart';
import 'package:sayphi/user/model/userModel.dart';
import 'package:sayphi/user/view/06+7+8_how_do_you_identify_screen.dart';
import 'package:sayphi/user/view/21_allow_location_screen.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class AuthRepo{

  static Future<void> completeUserAuth(String token) async{
    await UserViewModel.setAuthToken(token);
    final user = await verifyToken(token);

    if(user.isProfileComplete){
      if(LocalStorage.isFirstLogin.value){
        Get.offAll(()=>AllowLocationScreen());
      }else{
        Get.offAll(() => Home());
      }
    }else{
      Get.offAll(()=>UserGenderSetScreen());
    }

  }


  static Future<bool> loginWithEmailOrNumberAndPassword(String value, String password) async{

    ApiResponse response = await Api.query(
      query: GQueries.LOGIN_WITH_EMAIL_OR_NUMBER_AND_PASSWORD,
      queryName: GQueries.LOGIN_WITH_EMAIL_OR_NUMBER_AND_PASSWORD_NAME,
      variables: {
        'data' : value,
        'password' : password
      }
    );

    if(response.error){
      return true;
    }else{
      await completeUserAuth(response.data);
      return false;
    }

  }

  static Future<UserModel> verifyToken(String token) async{
    ApiResponse _response = await Api.query(
      queryName: GQueries.VERIFY_TOKEN_NAME,
      query: GQueries.VERIFY_TOKEN,
      variables: {
        'token' : token
      }
    );

    final user = UserModel.fromJson(_response.data);

    UserViewModel.setUserData(user);


    return user;
  }

  static loginWithToken(String idToken) async{
    ApiResponse _response = await Api.query(
        queryName: GQueries.LOGIN_WITH_ID_TOKEN_NAME,
        query: GQueries.LOGIN_WITH_ID_TOKEN,
        variables: {
          'idToken' : idToken
        }
    );

    if(_response.error){
      return true;
    }else{
      await completeUserAuth(_response.data);
      return false;
    }
  }

}