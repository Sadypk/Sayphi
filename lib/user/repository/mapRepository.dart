import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRepo{
  static Future<LatLng> getCurrentLatLng() async{
    Position position;
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    LatLng latLng;
    latLng = LatLng(position.latitude, position.longitude);
    return latLng;
  }
}