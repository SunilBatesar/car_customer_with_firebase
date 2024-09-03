import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    data();
  }

  data() async {
    final carController = Get.find<CarController>();
    await carController.getCar();
    final userId = prefs.getSharedPrefs(prefs.userKey);
    final userController = Get.find<UserController>();
    Future.delayed(Duration(milliseconds: 100), () async {
      if (userId.isNotEmpty) {
        await userController.getDataUser(userId);

        Get.toNamed(RoutesName.bottombarScreen);
      } else {
        Get.toNamed(RoutesName.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: styleSheet.services.screenHeight(context),
      width: styleSheet.services.screenWidth(context),
      decoration: BoxDecoration(color: styleSheet.colors.primary),
      child: Center(
        child: SvgPicture.asset(
          styleSheet.images.Applogo,
        ),
      ),
    ));
  }
}
