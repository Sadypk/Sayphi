import 'package:get/get.dart';
import 'package:graphql/client.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/model/apiResponse.dart';
import 'package:sayphi/mainApp/util/env.dart';
import 'package:sayphi/mainApp/util/logger.dart';
import 'package:sayphi/user/view_model/userViewModel.dart';


class Api{

  Api._();

  static RxBool apiLoading = false.obs;
  static void swapLoad(bool value) => apiLoading.value = value;

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
    bool showLoad = false,
    required String queryName,
    required String query,
    Map<String, dynamic> variables = const {}
  }) async{
    try{
      final _client = getClient(auth ? UserViewModel.userToken : null);

      if(showLoad) swapLoad(true);

      final response = await _client.query(
        QueryOptions(
          document: gql(query),
          variables: variables
        )
      );
      if(showLoad) swapLoad(false);

      logger.i(response, variables);


      if(response.data![queryName]['error']){
        Snack.showError(message: response.data![queryName]['msg']);
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
      if(showLoad) swapLoad(false);

      print(e.toString());
      Snack.showError(message: e.toString());
      return ApiResponse(
        error: true,
        message: e.toString()
      );
    }
  }

  static Future<ApiResponse> mutate({
    bool auth = false,
    bool showLoad = true,
    required String mutationName,
    required String mutation,
    Map<String, dynamic> variables = const {}
  }) async{
    try{
      final _client = getClient(auth ? UserViewModel.userToken : null);

      if(showLoad) swapLoad(true);

      final response = await _client.mutate(
          MutationOptions(
            document: gql(mutation),
            variables: variables
          )
      );
      if(showLoad) swapLoad(false);

      logger.i(response, variables);

      if(response.data![mutationName]['error']){
        Snack.showError(message: response.data![mutationName]['msg']);
        return ApiResponse(
            error: true,
            message: response.data![mutationName]['msg']
        );
      }else{
        if(response.data![mutationName].containsKey('token')){
          return ApiResponse(
              error: false,
              data: response.data![mutationName]['token']
          );
        }else{
          return ApiResponse(
              error: false,
              data: response.data![mutationName]['data']
          );
        }
      }

    }catch(e){
      if(showLoad) swapLoad(false);
      print(e.toString());
      Snack.showError(message: e.toString());
      return ApiResponse(
          error: true,
          message: e.toString()
      );
    }
  }
}