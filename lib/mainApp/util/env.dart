import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env{

  static late String apiLink;

  static Future<void> init() async{
    await load();
    apiLink = env['API_LINK']!;
  }
}