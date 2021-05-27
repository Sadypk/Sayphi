import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

class LocalStorage{
  static final _storage = GetStorage();
  static final _logger = Logger();

  static RxBool isFirstLogin = true.obs;

  /// STORAGE KEYS
  static const String _USER_FIRST_LOGIN = '_USER_FIRST_TIME_LOGIN';

  /// Public Functions
  Future<void> firstLoginDone() async{
    await _storage.write(_USER_FIRST_LOGIN, _USER_FIRST_LOGIN);
    isFirstLogin.value = false;
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

  static Future<void> init() async{
    try{
      await GetStorage.init();

      /// load some data
      await _checkFirstAppUser();
      _logger.i('Initialized', 'LocalStorage');
    }catch(e){
      _logger.e(e.toString(), 'LocalStorageFail');
    }
  }
}