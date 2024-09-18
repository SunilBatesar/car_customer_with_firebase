// ignore_for_file: avoid_print

import 'package:car_booking_customer/Controllers/booking_controller.dart';
import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:car_booking_customer/Data/Network/networkapi_service.dart';
import 'package:car_booking_customer/Models/firebase_response_model.dart';
import 'package:car_booking_customer/Models/user_model.dart';
import 'package:car_booking_customer/Response/data_response.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  // CALL NETWORKAPI SERVICE
  final _service = NetworkapiService();
  // PASSWORD
  String _password = "";
  setPassword(String v) {
    _password = v;
    update();
  }

  // USER DATA
  DataResponse<UserModel> _userdata = DataResponse.pending();
  // USER DATA GET
  DataResponse<UserModel> get userdata => _userdata;

  // USER DATA SET
  setUserData(UserModel userDataResponse) {
    _userdata.data = userDataResponse;
    update();
  }

  // GET USER DATA FIREBASE
  Future<void> getDataUser(String id) async {
    try {
      final response = await _service.get(styleSheet.apis.userDocument(id))
          as FirebaseResponseModel;
      if (response.docId.isNotEmpty) {
        _userdata = DataResponse.complete(UserModel.fromjson(response));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Sign Up FUNCTION
  Future<void> signup(Map<String, dynamic> jsondata) async {
    // USER STATE SET ISLOADING
    _userdata = DataResponse.isloading();
    // SET USER DATA jsondata TO uData
    final uData =
        UserModel.fromjson(FirebaseResponseModel(jsondata["user"], ""));
    try {
      // GET USER CREDENTIAL
      UserCredential userCredential = await _service.authenticate(
              state: AuthState.SIGNUP,
              json: {"email": uData.email, "password": _password})
          as UserCredential;
      // USER UID
      var id = userCredential.user!.uid;
      if (id.isNotEmpty) {
        // USE COPYWITH ANDE SET ID AND USER STATES
        UserModel data = uData.copyWith(id: id, owner: false, customer: true);
        // POST USER DATA IN FIREBASE DOC
        await _service.post(styleSheet.apis.userDocument(id), data.tomap());
        // SET USER ID SharedPreferences
        await prefs.setSharedPrefs(prefs.userKey, id);
        // SET DATA
        _userdata = DataResponse.complete(data);
      }
    } catch (e) {
      print(e.toString());
      _userdata = DataResponse.error(e.toString());
    } finally {
      update();
    }
  }

  // LOGIN FUNCTION
  Future<void> login(Map<String, dynamic> json) async {
    final carController = Get.find<CarController>(); //  CAR CONTROLLER
    final wishListController =
        Get.find<WishListController>(); // WISH LIST CONTROLLER
    final bookingController =
        Get.find<BookingController>(); // BOOKING CONTROLLER
    String email = json["email"];
    String password = json["password"];
    _userdata = DataResponse.isloading(); // USER STATE SET ISLOADING
    try {
      final snapshot = await _service.get(
              styleSheet.apis.userReference.where("email", isEqualTo: email))
          as List<FirebaseResponseModel>; // FIND USER DATA
      if (snapshot.first.docId.isNotEmpty) {
        UserModel data = UserModel.fromjson(
            snapshot.first); // USER DATA CONVERT TO USER MODEL
        if (data.customer == true) {
          await _service.authenticate(
              state: AuthState.LOGIN,
              json: {"email": data.email, "password": password});
          await prefs.setSharedPrefs(prefs.userKey,
              snapshot.first.docId); // SET USER ID SharedPreferences
          _userdata = DataResponse.complete(data); // SET DATA
          await carController.getCar(); // CALL GET CARS FUNCTION
          await wishListController.getWishData(
              snapshot.first.docId); // GET WISH LIST DATA TO FIREBASE
          await bookingController.getBooking(); // GET BOOKINGS
          Get.offNamed(RoutesName.bottombarScreen); // NEXT SCREEN
        }
      }
    } catch (e) {
      print("-----------");
      print(e.toString());
      print("-----------");
      _userdata = DataResponse.error(e.toString());
    }
  }

  // LOGOUT
  Future<void> logout() async {
    try {
      await _service.authenticate(state: AuthState.LOGOUT);
      prefs.removSharedPrefs(prefs.userKey);
      Get.offAllNamed(RoutesName.loginScreen);
    } catch (e) {
      print("-----------");
      print(e.toString());
      print("-----------");
    }
  }

  //  USER PROFILE UPDATE //
  Future<void> updateuserprofile(UserModel models) async {
    try {
      await _service.update(
          styleSheet.apis.userDocument(_userdata.data!.id!), models.tomap());
      _userdata = DataResponse.complete(models);
      update();
    } catch (e) {
      e.toString();
    }
  }

  Future<dynamic> deleteKey() async {
    try {
      await styleSheet.apis
          .userDocument("p7EuttMuNfWhnPq2bX4i3psoz6v2")
          .update({
        // "name": "Sunil",
        "name": FieldValue.delete(),
        // "ram": ["Ram", "Sunil"],
        // "ram": FieldValue.delete(),
      });
      // final data = UserModel.fromjson(FirebaseResponseModel.fromResponse(db));
      // print(data.email);
    } catch (e) {
      print("------${e.toString()}------");
    }
  }
}
