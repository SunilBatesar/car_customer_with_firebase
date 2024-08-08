import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Constants/style_sheet.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: PrimaryContainer(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              styleSheet.images.logout,
              height: 200.sp,
              width: 250.sp,
            ),
            styleSheet.services.addheight(10.h),
            Text(
              "Are you Sure you want to Logout ",
              textAlign: TextAlign.center,
              style: styleSheet.textTheme.fs18Medium
                  .copyWith(color: AppColors().red),
            ),
            styleSheet.services.addheight(10.h),
            Divider(color: styleSheet.colors.gray),
            styleSheet.services.addheight(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: PrimaryButton(
                  title: "No",
                  onPressed: () {
                    Get.back();
                  },
                  backGroundTransparent: true,
                )),
                styleSheet.services.addwidth(15.w),
                Expanded(
                    child: PrimaryButton(
                        title: "Yes",
                        onPressed: () {
                          Get.offAllNamed(RoutesName.loginScreen);
                        })),
              ],
            )
          ],
        ),
      ),
    );
  }
}
