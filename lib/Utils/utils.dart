import 'package:car_booking_customer/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Utils {
  //
  static erroSnakeBar(String message) {
    Get.snackbar("Error", message,
        snackPosition: SnackPosition.TOP,
        borderRadius: 20.r,
        duration: const Duration(seconds: 4),
        colorText: styleSheet.colors.red,
        backgroundColor: styleSheet.colors.white);
  }
}
