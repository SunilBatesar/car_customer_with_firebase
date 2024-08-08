import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Buttons/second_primary_button.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyAddressScreen extends StatelessWidget {
  const MyAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(LanguageConst.myAddress.tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryContainer(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.my_location_sharp),
                                styleSheet.services.addwidth(10.w),
                                Text(
                                  LanguageConst.addAddress.tr,
                                  style: styleSheet.textTheme.fs16Normal
                                      .copyWith(color: styleSheet.colors.gray),
                                )
                              ],
                            ),
                            SvgPicture.asset(
                              styleSheet.icons.rightArrow2,
                              height: 17.sp,
                              width: 17.sp,
                            )
                          ],
                        ),
                        styleSheet.services.addheight(10.h),
                        Divider(thickness: 1),
                        styleSheet.services.addheight(10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.my_location_sharp),
                            styleSheet.services.addwidth(10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(LanguageConst.addAddress.tr,
                                    style: styleSheet.textTheme.fs16Normal
                                        .copyWith(
                                            color: styleSheet.colors.gray)),
                                styleSheet.services.addheight(10.h),
                                Text("Rishi nagar , Hisar",
                                    style: styleSheet.textTheme.fs16Normal),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  styleSheet.services.addheight(15.h),
                  Text(LanguageConst.yourSavedAddresses.tr,
                      style: styleSheet.textTheme.fs14Normal),
                  styleSheet.services.addheight(15.h),
                  PrimaryContainer(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2.r),
                            decoration: BoxDecoration(
                                color: styleSheet.colors.white,
                                border:
                                    Border.all(color: styleSheet.colors.gray),
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.home,
                              size: 24.sp,
                            ),
                          ),
                          styleSheet.services.addwidth(10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(LanguageConst.addAddress.tr,
                                  style: styleSheet.textTheme.fs16Normal
                                      .copyWith(color: styleSheet.colors.gray)),
                              styleSheet.services.addheight(10.h),
                              Text("Rishi nagar 90 - S 99 gali 1 ",
                                  style: styleSheet.textTheme.fs14Normal),
                              styleSheet.services.addheight(10.h),
                              Text("Hisar,  Haryana ",
                                  style: styleSheet.textTheme.fs14Normal),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.delete)
                    ],
                  )),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SecondPrimaryButton(
                      title: LanguageConst.addAddress.tr,
                      onPressed: () {
                        Get.toNamed(RoutesName.addNewAddressScreen);
                      },
                      icon: styleSheet.icons.location2,
                      backGroundTransparent: true),
                ),
                styleSheet.services.addwidth(10.w),
                Expanded(
                    child: PrimaryButton(
                        title: LanguageConst.saveChanges.tr, onPressed: () {})),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
