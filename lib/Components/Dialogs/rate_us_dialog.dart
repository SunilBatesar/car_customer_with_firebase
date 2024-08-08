import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RateUsDialog extends StatelessWidget {
  const RateUsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: PrimaryContainer(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  LanguageConst.rateUs.tr,
                  style: styleSheet.textTheme.fs14NormalPacifico,
                  textAlign: TextAlign.center,
                ),
                styleSheet.services.addheight(15.h),
                Text(
                  LanguageConst.letsKWYLAWWCGBREATYRB.tr,
                  style: styleSheet.textTheme.fs14Normal,
                  textAlign: TextAlign.center,
                ),
                styleSheet.services.addheight(15.h),
                Text(
                  LanguageConst.rateYourExperience.tr,
                  style: styleSheet.textTheme.fs18Medium,
                  textAlign: TextAlign.center,
                ),
                styleSheet.services.addheight(15.h),
                Container(
                  width: styleSheet.services.screenWidth(context),
                  height: 1,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                        styleSheet.colors.lightyellow.withOpacity(0.4),
                        styleSheet.colors.lightyellow.withOpacity(0.6),
                        styleSheet.colors.lightyellow,
                        styleSheet.colors.lightyellow.withOpacity(0.6),
                        styleSheet.colors.lightyellow.withOpacity(0.4),
                      ])),
                ),
                styleSheet.services.addheight(10.h),
                RatingBar(
                  onRatingChanged: (v) {},
                  alignment: Alignment.center,
                  size: 35.sp,
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  filledColor: styleSheet.colors.lightyellow,
                  initialRating: 5,
                  maxRating: 5,
                ),
                styleSheet.services.addheight(10.h),
                Container(
                  width: styleSheet.services.screenWidth(context),
                  height: 1,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                        styleSheet.colors.lightyellow.withOpacity(0.4),
                        styleSheet.colors.lightyellow.withOpacity(0.6),
                        styleSheet.colors.lightyellow,
                        styleSheet.colors.lightyellow.withOpacity(0.6),
                        styleSheet.colors.lightyellow.withOpacity(0.4),
                      ])),
                ),
                styleSheet.services.addheight(15.h),
                Text(
                  LanguageConst.ouchPTUWWCI.tr,
                  style: styleSheet.textTheme.fs14Normal,
                  textAlign: TextAlign.center,
                ),
                styleSheet.services.addheight(15.h),
                TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: LanguageConst.typeHere.tr,
                    filled: true,
                    fillColor: styleSheet.colors.bgclr,
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: styleSheet.colors.lightwhite)),
                  ),
                ),
                styleSheet.services.addheight(15.h),
                Text(
                  "${LanguageConst.contactUs.tr}?",
                  style: styleSheet.textTheme.fs16Normal,
                  textAlign: TextAlign.center,
                ),
                styleSheet.services.addheight(15.h),
                Row(
                  children: [
                    Expanded(
                        child: PrimaryButton(
                            title: LanguageConst.cancel.tr,
                            backGroundTransparent: true,
                            onPressed: () {
                              Get.back();
                            })),
                    styleSheet.services.addwidth(15.w),
                    Expanded(
                        child: PrimaryButton(
                            title: LanguageConst.submit.tr,
                            onPressed: () {
                              Get.back();
                            })),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
