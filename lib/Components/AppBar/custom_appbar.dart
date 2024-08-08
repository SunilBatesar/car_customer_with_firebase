import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({super.key, super.title});
  @override
  Widget? get leading => IconButton(
      onPressed: () {
        Get.back();
      },
      icon: SvgPicture.asset(styleSheet.icons.leftArrow));

  @override
  Color? get backgroundColor => Colors.transparent;
  @override
  double? get elevation => 0;
  @override
  TextStyle? get titleTextStyle =>
      styleSheet.textTheme.fs24Normal.copyWith(color: styleSheet.colors.black);
}
