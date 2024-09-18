// ignore_for_file: avoid_print

import 'package:car_booking_customer/Data/Network/networkapi_service.dart';
import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Models/firebase_response_model.dart';
import 'package:car_booking_customer/Response/data_response.dart';
import 'package:car_booking_customer/main.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  // CALL NETWORKAPI SERVICE
  final _service = NetworkapiService();

  DataResponse<List<CarModel>> _carData = DataResponse.pending();
  DataResponse<List<CarModel>> get carData => _carData;

  // CAR DATA GET
  Future<void> getCar() async {
    try {
      final response = await _service.get(styleSheet.apis.carReference)
          as List<FirebaseResponseModel>;
      if (response.isNotEmpty) {
        _carData = DataResponse.complete(
            response.map((e) => CarModel.fromjson(e)).toList());
      }
    } catch (e) {
      print("GET CARS Function ::${e.toString()}-------");
      _carData = DataResponse.error(e.toString());
    } finally {
      update();
    }
  }

  CarModel getTargetCar(String id) =>
      _carData.data!.firstWhere((e) => e.id == id, orElse: () => CarModel());
}
