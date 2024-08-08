import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
