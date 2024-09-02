// ignore_for_file: non_constant_identifier_names, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:car_booking_customer/main.dart';

class CarPartTextIcon extends StatelessWidget {
  final String title;
  final String iconpath;
  Color? Colors, imgcolor;
  CarPartTextIcon(
      {super.key,
      required this.title,
      required this.iconpath,
      this.Colors,
      this.imgcolor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          iconpath,
          height: 14.sp,
          width: 14.sp,
          color: imgcolor == null ? null : imgcolor,
        ),
        Text(title,
            style: styleSheet.textTheme.fs10Normal.copyWith(
                color: Colors == null ? styleSheet.colors.white : Colors)),
      ],
    );
  }
}
