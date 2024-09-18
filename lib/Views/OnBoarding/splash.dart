import 'package:car_booking_customer/Controllers/booking_controller.dart';
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
    final carController = Get.find<CarController>(); //  CAR CONTROLLER
    await carController.getCar(); // CALL GET CARS FUNCTION
    final wishListController =
        Get.find<WishListController>(); // WISH LIST CONTROLLER
    final bookingController =
        Get.find<BookingController>(); // BOOKING CONTROLLER
    final userId =
        prefs.getSharedPrefs(prefs.userKey); // GET USER ID IN SHARED PREFS
    final userController = Get.find<UserController>(); // USER CONTRILLER
    Future.delayed(Duration(milliseconds: 100), () async {
      if (userId.isNotEmpty) {
        await userController.getDataUser(userId); // GET USER DATA TO FIREBASE
        await wishListController
            .getWishData(userId); // GET WISH LIST DATA TO FIREBASE
        await bookingController.getBooking(); // GET BOOKINGS FIREBASE
        Get.toNamed(RoutesName.bottombarScreen); // BOTTOMBAR SCREEN
      } else {
        Get.toNamed(RoutesName.loginScreen); // LOGIN SCREEN
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
