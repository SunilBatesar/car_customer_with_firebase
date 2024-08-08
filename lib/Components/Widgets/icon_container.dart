// ignore: must_be_immutable
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Iconcontainer extends StatelessWidget {
  IconData icon;
  Iconcontainer({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(9.sp),
      decoration: BoxDecoration(
          color: styleSheet.colors.white,
          borderRadius: BorderRadius.circular(5.r)),
      child: Icon(
        icon,
        size: 30.sp,
      ),
    );
  }
}
