import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';
import 'package:sayphi/mainApp/util/logger.dart';

class LocalStorage{
  static final _storage = GetStorage();

  static RxBool isFirstLogin = true.obs;

  /// STORAGE KEYS
  static const String _USER_FIRST_LOGIN = '_USER_FIRST_TIME_LOGIN';
  static const String _USER_AUTH_TOKEN = '_USER_AUTHENTICATION_TOKEN';

  /// Public Functions
  Future<void> firstLoginDone() async{
    await _storage.write(_USER_FIRST_LOGIN, _USER_FIRST_LOGIN);
    isFirstLogin.value = false;
  }

  Future<void> saveUserToken(String token) async{
    await _storage.write(_USER_AUTH_TOKEN, token);
  }







  /// PRIVATE FUNCTIONS
  static Future<void> _checkFirstAppUser() async{
    /// Storing a value in  local storage,
    /// which will help determine if the app
    /// has been started for the first time
    /// or started before
    if(_storage.hasData(_USER_FIRST_LOGIN)){
      final value = _storage.read(_USER_FIRST_LOGIN);
      /// IF the value not null
      /// meaning something is there
      /// hence user came to app home page before
      if(value != null){
        isFirstLogin .value= false;
      }
    }else{
      /// writing something to the flag false
      await _storage.write(_USER_FIRST_LOGIN, _USER_FIRST_LOGIN);
    }
  }

  static Future<void> _getUserToken() async{
    if(_storage.hasData(_USER_AUTH_TOKEN)){
      final value = _storage.read(_USER_AUTH_TOKEN);
      if(value != null || value != ''){
        await UserViewModel.setAuthToken(value);
      }
    }
  }

  static Future<void> init() async{
    try{
      await GetStorage.init();

      /// load some data
      await _checkFirstAppUser();
      await _getUserToken();


      logger.i('Initialized', 'LocalStorage');
    }catch(e){
      logger.e(e.toString(), 'LocalStorageFail');
    }
  }
}