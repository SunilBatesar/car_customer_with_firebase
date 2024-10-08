// ignore_for_file: avoid_print

import 'dart:math';

import 'package:car_booking_customer/Components/Dialogs/phone_setting_permission_dialog.dart';
import 'package:car_booking_customer/Models/car_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class AppFunctions {
  //Generate random id **//
  static String generateId({int length = 20}) {
    String characters = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    String id = "";

    String randomChoice() {
      Random random = Random();
      int index = random.nextInt(characters.length);
      return characters[index];
    }

    for (var i = 0; i < length; i++) {
      String character = randomChoice();
      id += character;
    }
    return id;
  }

  // LESS THEN PRICE FILTER
  static CreatePackageModel findLessPrice(List<CreatePackageModel> model) {
    List<CreatePackageModel> bestpackageList = model;
    bestpackageList.sort((a, b) => a.ammount!.compareTo(b.ammount!));
    return bestpackageList.first;
  }

  // LATLNG CHANGE IN USER FULL ADDRESS
  static Future<String> userFullAddress(LatLng latlng) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
    final place = placemark.first;
    String fullAddress =
        "${place.name},${place.subLocality}, ${place.locality}, ${place.postalCode},${place.administrativeArea}, ${place.country}";
    return fullAddress;
  }

  static locationPermission() async {
    final locationStates = await Permission.location.status;
    if (locationStates.isDenied || locationStates.isPermanentlyDenied) {
      try {
        Get.dialog(PhoneSettingPermissionDialog(
            title: "Allow access to loction",
            onTap: () async {
              await openAppSettings();
            }));
      } catch (e) {
        print("Location Permission Function ERROR :: ${e.toString()}");
      }
    }
  }
}
