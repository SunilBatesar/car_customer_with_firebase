import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: styleSheet.services.screenWidth(context) * 0.8,
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: styleSheet.colors.lightgray.withOpacity(0.1),
              spreadRadius: 0.2,
              blurRadius: 2,
            ),
          ],
          color: styleSheet.colors.white,
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(styleSheet.images.girlprofile),
                  styleSheet.services.addwidth(5.w),
                  Text(
                    "Mr joe Deo",
                    style: styleSheet.textTheme.fs16Normal,
                  ),
                  styleSheet.services.addwidth(5.w),
                  Text(
                    "1 ${LanguageConst.hrA.tr}",
                    style: styleSheet.textTheme.fs12Normal
                        .copyWith(color: styleSheet.colors.gray),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "4.5",
                    style: styleSheet.textTheme.fs12Normal,
                  ),
                  styleSheet.services.addwidth(3.w),
                  Icon(
                    Icons.star,
                    color: styleSheet.colors.yellow,
                    size: 20,
                  )
                ],
              )
            ],
          ),
          styleSheet.services.addheight(10.h),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Magna porttitor a cum sagittis eget ac integer mauris a. Lacinia ",
            style: styleSheet.textTheme.fs14Normal
                .copyWith(color: styleSheet.colors.gray),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
