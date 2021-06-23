import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/queries.dart';
import 'package:sayphi/mainApp/model/apiResponse.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';

class AuthRepo{


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

  static Future<void> completeUserAuth(String token) async{
    UserViewModel.setAuthToken(token);
  }

}