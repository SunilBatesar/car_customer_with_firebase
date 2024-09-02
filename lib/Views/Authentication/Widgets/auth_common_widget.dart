import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthCommonWidget extends StatelessWidget {
  final Widget widget;
  final EdgeInsetsGeometry? padding;
  const AuthCommonWidget({super.key, required this.widget, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: styleSheet.services.screenHeight(context),
      width: styleSheet.services.screenWidth(context),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                styleSheet.images.Bg_img,
              ))),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: BlurryContainer(
            blur: 8,
            width: styleSheet.services.screenWidth(context),
            elevation: 0,
            color: styleSheet.colors.gray.withOpacity(0.55),
            padding: padding == null
                ? EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h)
                : padding!,
            borderRadius: BorderRadius.all(Radius.circular(20.r)),
            child: widget,
          ),
        ),
      ),
    );
  }
}
