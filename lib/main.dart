import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sayphi/app.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await load();
  runApp(App());
}