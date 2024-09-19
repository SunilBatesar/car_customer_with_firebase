import 'dart:async';

import 'package:car_booking_customer/Data/Functions/app_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapGetXController extends GetxController {
  final Location _location = Location(); //LOCATION
  final addressTileController =
      TextEditingController(); //ADDRESS TILE CONTROLLER USE(MY ADDRES SCREEN)
  static LatLng _center = LatLng(29.1492, 75.7217); //FIX LAT AND LNG
  LatLng get center => _center; //FIX LAT AND LNG
  LocationData? _locationData; // LOCATION DATA
  LocationData get locationdata => _locationData!; // GET LOCATION DATA
  final Set<Marker> _markers = {}; // MARKERS
  Set<Marker> get markers => _markers; // GET MARKERS
  final CameraPosition _cameraPosition =
      CameraPosition(target: _center, zoom: 14.0); // DEFAULT CAMER POSITION
  CameraPosition get cameraPosition => _cameraPosition;
  String userLiveAddress = "";

  Future<void> getUserCurrentLocation() async {
    bool serviceEnabled = false;
    PermissionStatus permissionStatus;
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) serviceEnabled = await _location.requestService();
    permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.denied ||
        permissionStatus == PermissionStatus.deniedForever) {
      permissionStatus = await _location.requestPermission();
    }
    _locationData = await _location.getLocation();
    final latlng = LatLng(_locationData!.latitude!, _locationData!.longitude!);
    userLiveAddress = await AppFunctions.userFullAddress(latlng);
    _center = latlng;
    update();
  }

  Future markersUpdate(
      LatLng latlng, Completer<GoogleMapController> controller) async {
    _markers.clear();
    addressTileController.text = await AppFunctions.userFullAddress(latlng);
    _center = LatLng(_locationData!.latitude!, _locationData!.longitude!);
    _markers.add(Marker(
      markerId: MarkerId(latlng.toString()),
      position: latlng,
      infoWindow: InfoWindow(
        title: addressTileController.text,
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    mapControllerNewCameraPosition(latlng, controller);
    update();
  }

  Future mapControllerNewCameraPosition(
      LatLng value, Completer<GoogleMapController> controller) async {
    final db = await controller.future;
    await db.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: value, zoom: 14)));
    update();
  }
}
