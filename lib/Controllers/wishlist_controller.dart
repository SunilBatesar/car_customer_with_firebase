import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Data/Network/networkapi_service.dart';
import 'package:car_booking_customer/Models/firebase_response_model.dart';
import 'package:car_booking_customer/Utils/utils.dart';
import 'package:car_booking_customer/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  // CALL NETWORKAPI SERVICE
  final _service = NetworkapiService();

  List<String> _wishListData = [];
  List<String> get wishListData => _wishListData;

  //  ADD NEW WISH DATA (ID)
  addWish(String id) {
    _wishListData.add(id);
    update();
  }

  //  SET WISH DATA IN FIREBASE
  Future setWishData(String id) async {
    final userdata = Get.find<UserController>().userdata;
    try {
      if (_wishListData.isNotEmpty) {
        await _service
            .update(styleSheet.apis.wishListDocument(userdata.data!.id!), {
          "idList": FieldValue.arrayUnion([id]),
        });
        _wishListData.add(id);
        Utils.toastMessage("Wish list Add");
      } else {
        await _service
            .post(styleSheet.apis.wishListDocument(userdata.data!.id!), {
          "idList": [id],
        });
        _wishListData.add(id);
        Utils.toastMessage("Wish list Add");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }

  //  SET WISH DATA IN FIREBASE
  Future remove(String id) async {
    final userdata = Get.find<UserController>().userdata;
    try {
      await _service
          .update(styleSheet.apis.wishListDocument(userdata.data!.id!), {
        "idList": FieldValue.arrayRemove([id]),
      });
      _wishListData.remove(id);
      Utils.toastMessage("Wish list Removed");
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }

  // GET WISH LIST DATA
  Future<void> getWishData(String id) async {
    try {
      final response = await _service.get(styleSheet.apis.wishListDocument(id))
          as FirebaseResponseModel;
      if (response.data.isNotEmpty) {
        final data = ((response.data["idList"] ?? []) as List)
            .map((e) => e.toString())
            .toList();
        _wishListData = data;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }
}
