import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Container(
        padding: EdgeInsets.all(20.sp).copyWith(top: 50.h),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              styleSheet.colors.gray.withOpacity(0.5),
              styleSheet.colors.gray.withOpacity(0.3),
              styleSheet.colors.gray.withOpacity(0.2)
            ])),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 220,
              child: Stack(
                // clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  PrimaryContainer(
                      height: 100,
                      alignment: Alignment.center,
                      child: Text.rich(TextSpan(
                          text: "Are you sure you want to ",
                          style: styleSheet.textTheme.fs16Bold,
                          children: <TextSpan>[
                            TextSpan(
                                text: "Exit ?",
                                style: TextStyle(color: styleSheet.colors.red))
                          ]))),
                  Positioned(
                    top: 0,
                    child: Center(
                      child: SvgPicture.asset(styleSheet.images.sadCar),
                    ),
                  ),
                ],
              ),
            ),
            styleSheet.services.addheight(15.h),
            Row(
              children: [
                Expanded(
                    child: PrimaryButton(
                        title: LanguageConst.yes.tr,
                        backGroundTransparent: true,
                        onPressed: () {})),
                styleSheet.services.addwidth(15.w),
                GetBuilder<UserController>(
                    builder: (controller) => Expanded(
                        child: PrimaryButton(
                            title: LanguageConst.no.tr,
                            onPressed: () async {
                              await controller.logout();
                            }))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
