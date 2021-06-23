import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/model/apiResponse.dart';
import 'package:sayphi/mainApp/util/env.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';


class Api{

  Api._();

  static RxBool apiLoading = false.obs;
  static void swapLoad() => apiLoading.value = !apiLoading.value;

  static GraphQLClient getClient([String? token]){
    HttpLink link = HttpLink(
      // 'http://10.0.2.2:3000/graphql',
      Env.apiLink,
      defaultHeaders: <String, String>{
        'Authorization': 'Authorization $token',
      },
    );
    GraphQLClient cc = GraphQLClient(link: link, cache: GraphQLCache());
    return cc;
  }


  static Future<ApiResponse> query({
    bool auth = false,
    bool showLoad = true,
    required String queryName,
    required String query,
    Map<String, dynamic> variables = const {}
  }) async{
    try{
      final _client = getClient(auth ? UserViewModel.userToken : null);

      if(showLoad) swapLoad();

      final response = await _client.query(
        QueryOptions(
          document: gql(query),
          variables: variables
        )
      );
      if(showLoad) swapLoad();


      if(response.data![queryName]['error']){
        return ApiResponse(
          error: true,
          message: response.data![queryName]['msg']
        );
      }else{
        if(response.data![queryName].containsKey('token')){
          return ApiResponse(
              error: false,
              data: response.data![queryName]['token']
          );
        }else{
          return ApiResponse(
              error: false,
              data: response.data![queryName]['data']
          );
        }
      }

    }catch(e){
      print(e.toString());
      Snack.showError(message: e.toString());
      return ApiResponse(
        error: true,
        message: e.toString()
      );
    }
  }
}