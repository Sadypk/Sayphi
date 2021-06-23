import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/queries.dart';
import 'package:sayphi/mainApp/model/apiResponse.dart';
import 'package:sayphi/user/model/genderModel.dart';

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

}