import 'package:car_booking_customer/Data/Network/networkapi_service.dart';
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

  // USER DATA
  DataResponse<UserModel> _userdata = DataResponse.pending();
  // USER DATA GET
  DataResponse<UserModel> get userdata => _userdata;

  // USER DATA SET
  setUserData(DataResponse<UserModel> userDataResponse) {
    _userdata = userDataResponse;
    update();
  }

  // Sign Up FUNCTION
  Future<void> signup(Map<String, dynamic> jsondata) async {
    // USER STATE SET ISLOADING
    _userdata = DataResponse.isloading();
    // SET USER DATA jsondata TO uData
    final uData = UserModel.fromjson(jsondata["user"]);
    try {
      // GET USER CREDENTIAL
      UserCredential userCredential = await _service.authenticate(
              state: AuthState.SIGNUP,
              json: {"email": uData.email, "password": jsondata["password"]})
          as UserCredential;
      // USER UID
      var id = userCredential.user!.uid;
      if (id.isNotEmpty) {
        // USE COPYWITH ANDE SET ID AND USER STATES
        UserModel data = uData.copyWith(id: id, owner: false, customer: true);
        // POST USER DATA IN FIREBASE DOC
        await _service.post(styleSheet.apis.userDocument(id), data.tomap());
        // SET USER DATA SharedPreferences
        await prefs.setUserPrefe(model: data);
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
    String email = json["email"];
    String password = json["password"];
    // USER STATE SET ISLOADING
    _userdata = DataResponse.isloading();
    try {
      // FIND USER DATA
      final snapshot = await _service.get(
              styleSheet.apis.userReference.where("email", isEqualTo: email))
          as QuerySnapshot<Map<String, dynamic>>;
      if (snapshot.docs.isNotEmpty) {
        // USER DATA CONVERT TO USER MODEL
        UserModel data = UserModel.fromjson(snapshot.docs.first.data());
        if (data.customer == true) {
          await _service.authenticate(
              state: AuthState.LOGIN,
              json: {"email": data.email, "password": password});
          // SET USER DATA SharedPreferences
          await prefs.setUserPrefe(model: data);
          // SET DATA
          _userdata = DataResponse.complete(data);
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
}
