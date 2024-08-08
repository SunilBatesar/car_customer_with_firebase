import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final String icon;
  final bool isExpanded;
  const AuthButton(
      {super.key,
      required this.label,
      required this.onPressed,
      required this.icon,
      this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    final button = TextButton.icon(
      onPressed: () {
        onPressed();
      },
      label: Text(
        label,
        style: styleSheet.textTheme.fs14Normal
            .copyWith(color: styleSheet.colors.primary),
      ),
      icon: SvgPicture.asset(icon),
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
          backgroundColor: styleSheet.colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r))),
    );
    return isExpanded ? Row(children: [Expanded(child: button)]) : button;
  }
}
