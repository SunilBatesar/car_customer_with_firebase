import 'package:car_booking_customer/Classes/manage_data.dart';
import 'package:car_booking_customer/Controllers/language_controller.dart';
import 'package:car_booking_customer/Controllers/payment_address_controller.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:get/get.dart';

class AppInitialbinding extends Bindings {
  final sheet = ConstantSheet();
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(PaymentAddressController());
    Get.put(LanguageController());
  }
}
