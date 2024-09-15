// ignore_for_file: avoid_print

import 'package:car_booking_customer/Components/Dialogs/payment_dialog.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:car_booking_customer/Data/Network/networkapi_service.dart';
import 'package:car_booking_customer/Models/booking_model.dart';
import 'package:car_booking_customer/Models/firebase_response_model.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  // CALL NETWORKAPI SERVICE
  final _service = NetworkapiService();

  // TEXT EDITING CONTROLLER (USE ADDRESS WIDGET)
  final addresscontroller = TextEditingController(); //ADDRESS
  final destinationcontroller = TextEditingController(); //DESTINATION

  // BOOKING DATE AND TIME (USE PAYMENT WIDGET)
  DateTime? bookingtime; // BOOKING TIME
  DateTime? bookingdate; // BOOKING DATE

  // BOOKING PAY TYPES (USE PAYMENT WIDGET)
  String packagetype = "Cash"; // BOOKING PAY VALUE (CASH)

  List<BookingModel> _bookingData = []; // BOOKING ALL DATA
  List<BookingModel> get bookingData => _bookingData; // BOOKING DATA GET

  //  SET BOOKING DATA IN FIREBASE
  Future<void> setBooking() async {
    print("Start Function :: Set Booking");
    final wishListController =
        Get.find<WishListController>(); // WISHLIST CONTROLLER
    final userController = Get.find<UserController>(); // USER CONTROLLER
    final booking = BookingModel(
      address: addresscontroller.text,
      destination: destinationcontroller.text,
      // bookingState: BookingState.REQUEST,
      paymentType: packagetype,
      time: bookingtime.toString(),
      date: bookingdate.toString(),
      user: userController.userdata.data,
      cars: wishListController.wishListCarData,
    ); // SET ALL DATA TO BOOKING MODEL AND SAVE BOOKIN NAME VARIABLE
    try {
      // CALL POST FUNCTION (DATA POST FIREBASE)
      final response =
          await _service.post(styleSheet.apis.bookingReference, booking.tomap())
              as DocumentReference;
      if (response.id.isNotEmpty) {
        _bookingData
            .add(booking.copyWith(id: response.id)); // ADD NEW BOOKING DATA
        Future.delayed(
            Duration(seconds: 3),
            () => Get.offAllNamed(RoutesName
                .bottombarScreen)); // BOOKING COMPLIT AND BACK BOTTOMBAR SCREEN
        Get.dialog(PaymentDialog()); // PAYMENT AND BOOKING CONFIRM DIALOG
      }
    } catch (e) {
      print("SET Booking error :: ${e.toString()}");
    } finally {
      update();
    }
  }

  //  GET BOOKING DATA IN FIREBASE
  Future<void> getBooking() async {
    try {
      // CALL POST FUNCTION (DATA POST FIREBASE)
      final response = await _service.get(styleSheet.apis.bookingReference)
          as List<FirebaseResponseModel>;
      if (response.isNotEmpty) {
        final data = response
            .map((e) => BookingModel.fromjson(e))
            .toList(); // LIST<FIREBASERESPONSEMODEL> CONVERT TO LIST<BOOKINGMODEL>
        _bookingData = data; // SET BOOKING DATA
      }
    } catch (e) {
      print("SET Booking error :: ${e.toString()}");
    } finally {
      update();
    }
  }
}
