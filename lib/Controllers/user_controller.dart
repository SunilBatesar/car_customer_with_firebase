import 'package:car_booking_customer/Data/Network/networkapi_service.dart';
import 'package:car_booking_customer/Models/user_model.dart';
import 'package:car_booking_customer/Response/data_response.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:car_booking_customer/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final _service = NetworkapiService();
  DataResponse<UserModel> _userdata = DataResponse.pending();
  DataResponse<UserModel> get userdata => _userdata;

  setUserData(DataResponse<UserModel> userDataResponse) {
    _userdata = userDataResponse;
    update();
  }

  // Sign Up
  Future<void> signup(Map<String, dynamic> jsondata) async {
    final uData = UserModel.fromjson(jsondata["user"]);
    try {
      UserCredential userCredential = await _service.authenticate(
              AuthState.SIGNUP,
              json: {"email": uData.email, "password": jsondata["password"]})
          as UserCredential;
      var id = userCredential.user!.uid;
      if (id.isNotEmpty) {
        UserModel data = uData.copyWith(id: id, owner: false, customer: true);
        await _service.post(styleSheet.apis.userDocument(id), data.tomap());
        await prefs.setUserPrefe(model: data);
        _userdata = DataResponse.complete(data);
      }
    } catch (e) {
      print("-------------");
      print(e.toString());
      print("-------------");
      _userdata = DataResponse.error(e.toString());
    } finally {
      update();
    }
  }
}
