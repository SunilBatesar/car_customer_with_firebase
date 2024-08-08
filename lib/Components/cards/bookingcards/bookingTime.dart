import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingTimeCard extends StatelessWidget {
  const BookingTimeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: styleSheet.services.screenWidth(context),
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: styleSheet.colors.white,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LanguageConst.timeAndDate.tr,
            style: styleSheet.textTheme.fs16Normal,
          ),
          styleSheet.services.addheight(15.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageConst.time.tr,
                    style: styleSheet.textTheme.fs14Normal
                        .copyWith(color: styleSheet.colors.gray),
                  ),
                  styleSheet.services.addheight(5.h),
                  Text(
                    "10:00am",
                    style: styleSheet.textTheme.fs16Normal,
                  ),
                ],
              ),
              styleSheet.services.addwidth(20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  styleSheet.services.addwidth(20.w),
                  Text(
                    LanguageConst.date.tr,
                    style: styleSheet.textTheme.fs14Normal
                        .copyWith(color: styleSheet.colors.gray),
                  ),
                  styleSheet.services.addheight(5.h),
                  Text(
                    "12/06/24",
                    style: styleSheet.textTheme.fs16Normal,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
