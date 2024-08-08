import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: styleSheet.colors.bgclr,
          // minRadius: 30.r,
          child: Image.asset(
            styleSheet.images.girlprofile,
            height: 55.sp,
            width: 55.sp,
            fit: BoxFit.cover,
          ),
        ),
        styleSheet.services.addwidth(10.w),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: styleSheet.colors.white),
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Booking",
                      style: styleSheet.textTheme.fs16Normal,
                    ),
                    Text(
                      "1 ${LanguageConst.hrA.tr}",
                      style: styleSheet.textTheme.fs12Normal
                          .copyWith(color: styleSheet.colors.primary),
                    ),
                  ],
                ),
                styleSheet.services.addheight(3.h),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Magna porttitor a cum sagittis eget ac in ",
                  style: styleSheet.textTheme.fs14Normal
                      .copyWith(color: styleSheet.colors.gray),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
