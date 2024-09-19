import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Data/Network/networkapi_service.dart';
import 'package:car_booking_customer/Models/address_model.dart';
import 'package:car_booking_customer/Models/firebase_response_model.dart';
import 'package:car_booking_customer/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  // CALL NETWORKAPI SERVICE
  final _service = NetworkapiService();

  List<AddressModel> _addressData = []; // ADDRESS ALL DATA
  List<AddressModel> get addressData => _addressData; // ADDRESS DATA GET

  //  SET ADDRESS
  // setAddressInController(AddressModel model) {
  //   _addressData.add(model);
  //   update();
  // }

  // //  REMOVE ADDRESS
  // removeAddressInController(AddressModel model) {
  //   _addressData
  //       .removeWhere((e) => e.houseNoBuildingName == model.houseNoBuildingName);
  //   update();
  // }

  // SET USER ADDRESS IN FIREBASE
  Future<void> setUserAddress(AddressModel model) async {
    final userdata = Get.find<UserController>().userdata; // USER CONTROLLER

    try {
      if (_addressData.isNotEmpty) {
        print("=========");
        // UPDATE (ADD) NEW ADDRESS
        await _service
            .update(styleSheet.apis.addressDocument(userdata.data!.id!), {
          "address List": FieldValue.arrayUnion([model.toMap()]),
        });
        _addressData.add(model); //SET ADDRESS DATA
      } else {
        print("----------");
        // POST (SET) NEW ADDRESS
        await _service
            .post(styleSheet.apis.addressDocument(userdata.data!.id!), {
          "address List": [model.toMap()]
        });
        _addressData.add(model); // SET ADDRESS DATA
      }
    } catch (e) { 
      print("SET USER ADDRESS ERROR :: ${e.toString()}");
    } finally {
      update();
    }
  }

  // GET ADDRESS IN FIREBASE
  Future<void> getUserAddress() async {
    final userdata = Get.find<UserController>().userdata; // USER CONTROLLER
    try {
      final response = await _service
              .get(styleSheet.apis.addressDocument(userdata.data!.id!))
          as FirebaseResponseModel;
      if (response.docId.isNotEmpty) {
        List<AddressModel> data =
            ((response.data["address List"] ?? []) as List)
                .map((e) => AddressModel.fromjson(FirebaseResponseModel(e, "")))
                .toList();
        _addressData = data;
      }
    } catch (e) {
      print("GET USER ADDRESS ERROR :: ${e.toString()}");
    } finally {
      update();
    }
  }

  // REMOVE ADDRESS IN FIREBASE
  Future<void> removeUserAddress(AddressModel model) async {
    final userdata = Get.find<UserController>().userdata; // USER CONTROLLER
    try {
      // USE UPDATE FUNCTION AND REMOVE USER ADDRESS
      await _service
          .update(styleSheet.apis.addressDocument(userdata.data!.id!), {
        "address List": FieldValue.arrayRemove([model.toMap()]),
      });
      _addressData.removeWhere((e) => e.id == model.id);
    } catch (e) {
      print("REMOVE USER ADDRESS ERROR :: ${e.toString()}");
    } finally {
      update();
    }
  }
}
