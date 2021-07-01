import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/queries.dart';
import 'package:sayphi/mainApp/model/apiResponse.dart';
import 'package:sayphi/mainApp/model/promtModel.dart';
import 'package:sayphi/mainApp/model/questionAnswerModel.dart';
import 'package:sayphi/user/model/ethnicityModel.dart';
import 'package:sayphi/user/model/genderModel.dart';
import 'package:sayphi/user/model/religionModel.dart';

class BasicDataRepo{

  static Future<List<GenderModel>> getAllGenders() async{

    ApiResponse _response = await Api.query(
      queryName: GQueries.GET_ALL_GENDERS_NAME,
      query: GQueries.GET_ALL_GENDERS
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((gender) => GenderModel.fromJson(gender)));
    }

  }

  static Future<List<EthnicityModel>> getAllEthnicity() async{

    ApiResponse _response = await Api.query(
      queryName: GQueries.GET_ALL_ETHNICITY_NAME,
      query: GQueries.GET_ALL_ETHNICITY
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((gender) => EthnicityModel.fromJson(gender)));
    }

  }

  static Future<List<QuestionAnswerModel>> getAllQuestions() async{
    ApiResponse _response = await Api.query(
        queryName: GQueries.GET_ALL_QUESTIONS_NAME,
        query: GQueries.GET_ALL_QUESTIONS
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((gender) => QuestionAnswerModel.fromJson(gender)));
    }
  }

  static Future<List<PromptModel>> getAllPrompts() async{
    ApiResponse _response = await Api.query(
        queryName: GQueries.GET_ALL_PROMPTS_NAME,
        query: GQueries.GET_ALL_PROMPTS
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((gender) => PromptModel.fromJson(gender)));
    }
  }

  static Future<List<ReligionModel>> getAllReligion() async{

    ApiResponse _response = await Api.query(
        queryName: GQueries.GET_ALL_RELIGION_NAME,
        query: GQueries.GET_ALL_RELIGION
    );

    if(_response.error){
      return [];
    }else{
      return List.from(_response.data.map((gender) => ReligionModel.fromJson(gender)));
    }

  }
}