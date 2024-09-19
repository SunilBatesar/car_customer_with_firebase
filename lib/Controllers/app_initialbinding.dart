import 'package:car_booking_customer/Classes/manage_data.dart';
import 'package:car_booking_customer/Controllers/address_controller.dart';
import 'package:car_booking_customer/Controllers/booking_controller.dart';
import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Controllers/google_map_controller.dart';
import 'package:car_booking_customer/Controllers/language_controller.dart';
import 'package:car_booking_customer/Controllers/payment_address_controller.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:get/get.dart';

class AppInitialbinding extends Bindings {
  final sheet = ConstantSheet();
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(PaymentAddressController());
    Get.put(LanguageController());
    Get.put(CarController());
    Get.put(WishListController());
    Get.put(BookingController());
    Get.put(GoogleMapGetXController());
    Get.put(AddressController());
  }
}
