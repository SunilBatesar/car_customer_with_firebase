import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecondPrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final bool isExpanded;
  final bool isloading;
  final bool backGroundTransparent;
  final String icon;
  final Color? iconColor;
  const SecondPrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    this.iconColor,
    this.backGroundTransparent = false,
    this.isExpanded = false,
    this.isloading = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = TextButton.icon(
        onPressed: () {
          isloading ? null : onPressed();
        },
        style: TextButton.styleFrom(
            // padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
            minimumSize: Size(100, 50),
            backgroundColor: backGroundTransparent
                ? Colors.transparent
                : styleSheet.colors.primary,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: styleSheet.colors.primary),
                borderRadius: BorderRadius.circular(10.r))),
        icon: SvgPicture.asset(
          icon,
          color: iconColor,
        ),
        label: isloading
            ? SizedBox(
                height: 20.sp,
                width: 20.sp,
                child: CircularProgressIndicator(
                  color: styleSheet.colors.white,
                ),
              )
            : Text(
                title,
                style: styleSheet.textTheme.fs16Normal.copyWith(
                    color: backGroundTransparent
                        ? styleSheet.colors.primary
                        : styleSheet.colors.white),
              ));
    return isExpanded
        ? Row(
            children: [
              Expanded(child: button),
            ],
          )
        : button;
  }
}
