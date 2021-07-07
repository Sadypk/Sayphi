import 'package:sayphi/features/homeScreen/model/matchedUserModel.dart';
import 'package:get/get.dart';

class HomeViewModel{
  static RxList<MinimalUserModel> matchedUserList = <MinimalUserModel>[].obs;
  static void addData(List<MinimalUserModel> newData) => matchedUserList.addAll(newData);
}