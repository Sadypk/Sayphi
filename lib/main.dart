import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:sayphi/app.dart';
import 'package:sayphi/mainApp/util/env.dart';
import 'package:sayphi/mainApp/util/fcmHandler.dart';
import 'package:sayphi/mainApp/util/localStorage.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();

  /// firebase core
  await Firebase.initializeApp();


  /// init notification
  await FCMHandler.init();

  /// loading environment variables
  await Env.init();

  /// starting local storage
  await LocalStorage.init();


  runApp(App());
}