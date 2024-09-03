import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Data/Network/networkapi_service.dart';
import 'package:car_booking_customer/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  // CALL NETWORKAPI SERVICE
  final _service = NetworkapiService();

  final List<String> _wishListData = [];
  List<String> get wishListData => _wishListData;

  //  ADD NEW WISH DATA (ID)
  addWish(String id) {
    _wishListData.add(id);
    update();
  }

  //  SET WISH DATA IN FIREBASE
  Future setWishData(String id) async {
    final userdata = Get.find<UserController>().userdata;
    print("=====ID = ${userdata.data!.id}");
    try {
      await _service
          .update(styleSheet.apis.wishListDocument(userdata.data!.id!), {
        "userWishId": FieldValue.arrayUnion([id]),
      });
    } catch (e) {
      print("-----------");
      print(e.toString());
      print("-----------");
    }
  }
}
