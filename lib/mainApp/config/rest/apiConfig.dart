import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sayphi/mainApp/util/env.dart';

class RestApi{

  static final _dio = Dio();

  static Future<LatLng> getLatLngFromPlaceID(String placeId) async{


    final link = 'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=${Env.googleKey}';

    final _response = await _dio.get(link);

    final locationData = _response.data['result']['geometry']['location'];

    return LatLng(locationData['lat'], locationData['lng']);

  }

}