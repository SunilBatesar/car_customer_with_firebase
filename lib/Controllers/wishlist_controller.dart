// ignore_for_file: avoid_print

import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Data/Functions/app_functions.dart';
import 'package:car_booking_customer/Data/Network/networkapi_service.dart';
import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Models/firebase_response_model.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:car_booking_customer/Utils/utils.dart';
import 'package:car_booking_customer/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  // CALL NETWORKAPI SERVICE
  final _service = NetworkapiService();

  List<String> _wishListData = [];
  List<String> get wishListData => _wishListData;

  // CAR DATA FILTER
  final List<CarModel> _wishListCarData = [];
  List<CarModel> get wishListCarData => _wishListCarData;

  //  increase
  increaseQuantity(String id, CreatePackageModel model) {
    final index = _wishListCarData.indexWhere((e) => e.id == id);
    final a = _wishListCarData[index];
    final quantity = a.bookingquantity! + 1;
    final totalPrice = (model.ammount ?? 0) * quantity;
    _wishListCarData[index] = a.copyWith(
        bookingquantity: quantity,
        package: [model.copywith(ammount: totalPrice)]);
    update();
  }

  // decrease
  decreaseQuantity(String id, CreatePackageModel model, int firstammount) {
    final index = _wishListCarData.indexWhere((e) => e.id == id);
    final a = _wishListCarData[index];
    final quantity = a.bookingquantity! - 1;
    final totalPrice = (model.ammount ?? 0) - firstammount;
    _wishListCarData[index] = a.copyWith(
        bookingquantity: quantity,
        package: [model.copywith(ammount: totalPrice)]);
    update();
  }

  // SELECT NEW PACKAGE TYPE AND SET BOOKINGQUANTITY(1) AND AMMOUNT OLD PRICE
  selectNewPackage(String id, PackageType type) {
    final index = _wishListCarData.indexWhere((e) => e.id == id);
    final packagedata = getAmount(type, id);
    _wishListCarData[index] = _wishListCarData[index]
        .copyWith(bookingquantity: 1, package: [packagedata!]);
    update();
  }

  // GET PACKAGE
  CreatePackageModel? getAmount(PackageType type, String carID) {
    final carController = Get.find<CarController>(); // CARCONTROLLER
    final car = carController.getTargetCar(carID);
    CreatePackageModel? price;
    if (type == PackageType.DAY) {
      price = car.package!.firstWhere((e) => e.type == PackageType.DAY);
    } else if (type == PackageType.WEEK) {
      price = car.package!.firstWhere((e) => e.type == PackageType.WEEK);
    } else if (type == PackageType.HOUR) {
      price = car.package!.firstWhere((e) => e.type == PackageType.HOUR);
    }
    return price;
  }

  // FILTER FUNCTION WISH LIST ID TO CAR DATA
  void filterCar() {
    final carController = Get.find<CarController>(); // CAR CONTROLLER
    try {
      List<CarModel> carData = []; // LIST CAR DATA
      // LOOP FIND WISH LIST CARS
      for (var car in carController.carData.data!) {
        final value = _wishListData.any((element) =>
            element == car.id); // ANY METHOD FIND CAR ID IN WISHLISTDATA
        // CHECK VALUE
        if (value) {
          final lessPrice =
              AppFunctions.findLessPrice(car.package!); // FIND LESS PRICE
          // ADD CAR IN CARDATA AND USE COPYWITH UPDATE PACKAGE
          carData.add(car.copyWith(package: [lessPrice]));
        }
      }
      _wishListCarData.addAll(carData); // ADD ALL FIND CARS IN WISHLISTCARDATA
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }

  // CAR DATA UPDATE (ONLY CONTROLLER)
  upDateCar(CarModel model) {
    try {
      final index = _wishListCarData
          .indexWhere((e) => e.id == model.id); // FIND CAR INDEX
      _wishListCarData[index] = model; // SET NEW CAR DATA IN WISHLISTCARDATA
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }

  //  SET WISH DATA IN FIREBASE AND ADD WISHLISTCARDATA
  Future setWishData(String id) async {
    final userdata = Get.find<UserController>().userdata; // USER CONTROLLER
    final carController = Get.find<CarController>(); // CAR CONTROLLER
    final data = carController.carData.data!
        .firstWhere((element) => element.id == id); // FILTER CAR
    final lessPrice =
        AppFunctions.findLessPrice(data.package!); //FIND CAR DATA IN LESS PRICE
    final car =
        data.copyWith(package: [lessPrice]); // CAR DATA ADD (LESS PRICE)
    try {
      if (_wishListData.isNotEmpty) {
        // CALL UPDATE FUNCTION AND UPDATE(ADD) NEW ID
        await _service
            .update(styleSheet.apis.wishListDocument(userdata.data!.id!), {
          "idList": FieldValue.arrayUnion([id]),
        });
        _wishListData.add(id); // ADD CAR ID IN WISH LIST
        _wishListCarData.add(car); // ADD CAR DATA IN WISH LIST CAR DATA
        Utils.toastMessage("Wish list Add"); // SHOW TOAST MESSAGE IN SCREEN
      } else {
        // CALL POST FUNCTION AND UPDATE(ADD) NEW ID
        await _service
            .post(styleSheet.apis.wishListDocument(userdata.data!.id!), {
          "idList": [id],
        });
        _wishListData.add(id); // ADD CAR ID IN WISH LIST
        _wishListCarData.add(car); // ADD CAR DATA IN WISH LIST CAR DATA
        Utils.toastMessage("Wish list Add"); // SHOW TOAST MESSAGE IN SCREEN
      }
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }

  //  REMOVE WISH DATA IN FIREBASE
  Future remove(String id) async {
    final userdata = Get.find<UserController>().userdata; // USER CONTROLLER
    try {
      // CALL UPDATE FUNCTION ANDE REMOVE ID
      await _service
          .update(styleSheet.apis.wishListDocument(userdata.data!.id!), {
        "idList": FieldValue.arrayRemove([id]),
      });
      _wishListData.remove(id); // REMOVE ID IN WISHLISTDATA
      _wishListCarData
          .removeWhere((e) => e.id == id); // REMOVE ID DATA IN WISHLISTCARDATA
      Utils.toastMessage("Wish list Removed"); // SHOW TOAST MESSAGE IN SCREEN
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
          as FirebaseResponseModel; // CALL GET FUNCTION AND GET WISHLIST DATA
      if (response.data.isNotEmpty) {
        final data = ((response.data["idList"] ?? []) as List)
            .map((e) => e.toString())
            .toList(); // RESPONSE SET TO DATA
        _wishListData = data; // SET WISHLISTDATA
        filterCar(); // CALL FILTERCAR FUNCTION
      }
    } catch (e) {
      print(e.toString());
    } finally {
      update();
    }
  }
}
