import 'package:get/get.dart';
import 'package:sayphi/features/dayStory/model/dayDataModel.dart';
import 'package:sayphi/features/dayStory/model/userDayModel.dart';

class DayViewModel{

  static RxList<DayDataModel> userDay = <DayDataModel>[].obs;
  static void setUserDay (List<DayDataModel> data){
    userDay.clear();
    userDay.value = data;
  }

  static RxList<UserDayModel> allDay = <UserDayModel>[].obs;
  static void setAllDay (List<UserDayModel> data){
    allDay.clear();
    allDay.value = data;
  }
}