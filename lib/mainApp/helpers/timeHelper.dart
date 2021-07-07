import 'package:dash_chat/dash_chat.dart';

class TimeHelper{

  static String getDayTime(String createdAt){

    DateTime _time = DateTime.fromMillisecondsSinceEpoch(int.parse(createdAt));
    DateTime _now = DateTime.now();

    final _diff = _time.difference(_now);

    if(_diff.inMinutes < 60){
      return '${_diff.inMinutes} Mins';
    }

    if(_diff.inHours < 24){
      return '${_diff.inHours} Hours';
    }

    return '';
  }


  static String? birthday(int birthday){

    return DateFormat('dd MMM yyy').format(DateTime.fromMillisecondsSinceEpoch(birthday));
  }
}