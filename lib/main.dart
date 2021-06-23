import 'package:flutter/cupertino.dart';
import 'package:sayphi/app.dart';
import 'package:sayphi/mainApp/util/env.dart';
import 'package:sayphi/mainApp/util/localStorage.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();

  /// loading environment variables
  await Env.init();

  /// starting local storage
  await LocalStorage.init();

  runApp(App());
}