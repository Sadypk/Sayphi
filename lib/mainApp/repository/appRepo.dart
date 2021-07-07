import 'package:sayphi/mainApp/config/graphql/apiConfig.dart';
import 'package:sayphi/mainApp/config/graphql/queries.dart';
import 'package:sayphi/mainApp/model/apiResponse.dart';
import 'package:sayphi/mainApp/model/policyModel.dart';
import 'package:sayphi/mainApp/view_model/appViewModel.dart';

class AppRepo{

  static Future<void> init() async{
    final _response = await Future.wait([
      getPolicy('TC'),
      getPolicy('Stream'),
      getPolicy('Legal'),
    ]);

    AppViewModel.termsAndConditions = _response[0];
    AppViewModel.streamingConditions = _response[1];
    AppViewModel.legalAndPrivacy = _response[2];

  }

  static Future<PolicyModel> getPolicy(String type) async{

    ApiResponse _response = await Api.query(
      queryName: GQueries.GET_POLICY_NAME,
      query: GQueries.GET_POLICY,
      variables: {
        'type' : type
      },
      showLoad: false
    );

    return PolicyModel.fromJson(_response.data);
  }

}