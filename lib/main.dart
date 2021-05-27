import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sayphi/app.dart';
import 'package:sayphi/mainApp/util/localStorage.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();

  /// loading environment variables
  await load();

  /// starting local storage
  await LocalStorage.init();

  runApp(App());
}