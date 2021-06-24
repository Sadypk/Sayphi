import 'package:sayphi/mainApp/util/localStorage.dart';

class UserViewModel{

  static final LocalStorage _storage = LocalStorage();

  static late String userToken;
  static Future<void> setAuthToken(String newToken) async{
    userToken = newToken;
    await _storage.saveUserToken(newToken);
  }
}