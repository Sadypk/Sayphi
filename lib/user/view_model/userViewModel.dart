import 'package:sayphi/mainApp/util/localStorage.dart';
import 'package:sayphi/user/model/userModel.dart';
import 'package:get/get.dart';

class UserViewModel{

  UserViewModel._();

  static final LocalStorage _storage = LocalStorage();

  static late String userToken;
  static Future<void> setAuthToken(String newToken) async{
    userToken = newToken;
    await _storage.saveUserToken(newToken);
  }

  static Rx<UserModel> user = UserModel(id: '', emailOrPhone: '', isProfileComplete: false, images: [], showGenderInProfile: false, videos: [], filters: UserFilterModel(photoVerified: false)).obs;
  static void setUserData(UserModel newUser) {
    user.value = newUser;
  }
}