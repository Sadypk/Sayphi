import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env{

  static late String apiLink;
  static late String agoraID;
  static late String agoraTOKEN;
  static late String twilioID;
  static late String twilioTOKEN;
  static late String googleKey;

  static Future<void> init() async{
    await load();
    apiLink = env['API_LINK']!;
    agoraID = env['agora_ID']!;
    agoraTOKEN = env['agora_TOKEN']!;
    twilioID = env['twilio_ID']!;
    twilioTOKEN = env['twilio_TOKEN']!;
    googleKey = env['GOOGLE_API_KEY']!;
  }
}