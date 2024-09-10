import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
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
    //  CAR CONTROLLER
    final carController = Get.find<CarController>();
    // CALL GET CARS FUNCTION
    await carController.getCar();
    //  WISH LIST CONTROLLER
    final wishListController = Get.find<WishListController>();
    //  GET USER ID IN SHARED PREFS
    final userId = prefs.getSharedPrefs(prefs.userKey);
    // USER CONTRILLER
    final userController = Get.find<UserController>();
    Future.delayed(Duration(milliseconds: 100), () async {
      if (userId.isNotEmpty) {
        // GET USER DATA TO FIREBASE
        await userController.getDataUser(userId);
        // GET WISH LIST DATA TO FIREBASE
        await wishListController.getWishData(userId);
        // CALL FILTER WISH LIST CARS FUNCTION
        wishListController.filterCar();
        // BOTTOMBAR SCREEN
        Get.toNamed(RoutesName.bottombarScreen);
      } else {
        // LOGIN SCREEN
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
