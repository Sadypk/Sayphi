import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sayphi/mainApp/components/loader.dart';
import 'package:sayphi/mainApp/components/mainButton.dart';
import 'package:sayphi/mainApp/helpers/snack.dart';
import 'package:sayphi/mainApp/view/home.dart';
import 'package:sayphi/user/model/userModel.dart';
import 'package:sayphi/user/repository/mapRepository.dart';
import 'package:sayphi/user/repository/userRepo.dart';

class AllowLocationScreen extends StatefulWidget {
  const AllowLocationScreen({Key? key}) : super(key: key);

  @override
  _AllowLocationScreenState createState() => _AllowLocationScreenState();
}

class _AllowLocationScreenState extends State<AllowLocationScreen> {

  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _gMarkers = Set<Marker>();
  LatLng? _currentLocation;
  bool _isMapLoading = true;


  Future<void> _addMarker(LatLng location) async{
    setState(() {
      _gMarkers.add(Marker(
        markerId: MarkerId('gMarker'),
        position: location
      ));
    });
    _currentLocation = location;
    await _updateCameraPosition(location);
  }

  /// for first time only
  bool initLoadDone = false;
  Future<void> _updateCameraPosition(LatLng loc) async {
    CameraPosition cPosition = CameraPosition(
      zoom: 18,
      tilt: 15,
      target: LatLng(loc.latitude, loc.longitude),
    );

    /// not running when this is called for the first time
    /// as GoogleMapController is not yet initialized,
    /// so the future wont return anything
    /// and it will stuck
    if(initLoadDone){
      GoogleMapController controller = await _controller.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    }else{
      initLoadDone = true;
    }
  }

  void changeLocation(LatLng argument) {
    _addMarker(argument);
  }

  @override
  void initState() {
    if(mounted){
      super.initState();
      _init();
    }else{
      return ;
    }
  }

  CameraPosition? _initialCameraPosition;
  _init() async{
    try{
      _currentLocation = await MapRepo.getCurrentLatLng();
      _initialCameraPosition = CameraPosition(
        zoom: 18,
        tilt: 15,
        target: LatLng(_currentLocation!.latitude, _currentLocation!.longitude),
      );
      await _addMarker(_currentLocation!);
      setState(() => _isMapLoading = false);
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isMapLoading ? Loader() : GoogleMap(
        initialCameraPosition: _initialCameraPosition!,
        onMapCreated: (GoogleMapController controller) => _controller.complete(controller),
        markers: _gMarkers,
        onTap: changeLocation,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .2 , vertical: 20),
        child: MainButton(
          onPress: () async{

            if(_currentLocation != null){

              UserRepo.updateProfile(
                userLocation: LocationModel(
                  name: await MapRepo.getAddressFromLatLng(_currentLocation!),
                  coordinates: CoordinatesModel(
                    lat: _currentLocation!.latitude,
                    lng: _currentLocation!.longitude
                  )
                )
              );

              Get.offAll(()=>Home());
            }else{
              Snack.top(
                title: 'Wait!',
                message: 'Please choose a location to continue'
              );
            }


          },
          label: 'Select Location',
        ),
      ),
    );
  }


}