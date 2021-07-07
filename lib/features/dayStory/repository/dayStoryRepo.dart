import 'dart:io';

import 'package:sayphi/features/dayStory/model/dayDataModel.dart';
import 'package:sayphi/features/dayStory/model/userDayModel.dart';
import 'package:sayphi/features/dayStory/view_model/dayViewModel.dart';
import 'package:sayphi/mainApp/config/firebase/fStorage.dart';
import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/mutations.dart';
import 'package:sayphi/mainApp/config/graphql/queries.dart';

class DayStoryRepo{

  static Future<void> addToDay(List<File> images) async{

    List<String> imageLinks = await Future.wait(images.map((e) => FStorage.storeFile(e)));


    await Future.wait(imageLinks.map((link) => Api.mutate(
      mutationName: GMutation.USER_ADD_DAY_NAME,
      mutation: GMutation.USER_ADD_DAY,
      variables: {
        'image' : link
      },
      auth: true
    )));

  }

  static Future<void> _getUserDay() async{

    final _response = await Api.query(showLoad: false, queryName: GQueries.USER_GET_DAYS_NAME, query: GQueries.USER_GET_DAYS,auth: true);

    if(!_response.error){

      List<DayDataModel> data = List.from(_response.data.map((data) => DayDataModel.fromJson(data)));

      DayViewModel.setUserDay(data);
    }
  }

  static Future<void> _getAllDays() async{
    final _response = await Api.query(showLoad: false, queryName: GQueries.GET_ALL_DAYS_NAME, query: GQueries.GET_ALL_DAYS,auth: true);

    if(!_response.error){

      List<UserDayModel> data = List.from(_response.data.map((data) => UserDayModel.fromJson(data)));

      DayViewModel.setAllDay(data);
    }
  }

  static Future<void> init() async{

    await Future.wait([
      _getUserDay(),
      _getAllDays(),
    ]);
  }

}