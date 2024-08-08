import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UpiDialog extends StatelessWidget {
  const UpiDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      insetPadding: EdgeInsets.all(20.sp),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: styleSheet.colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              minLeadingWidth: 0,
              subtitle: Text(LanguageConst.addYourUPIID.tr,
                  style: styleSheet.textTheme.fs14Normal),
              title: Text(
                "UPI",
                style: styleSheet.textTheme.fs18Medium
                    .copyWith(color: styleSheet.colors.black),
              ),
              leading: Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: styleSheet.colors.gray.withOpacity(0.6))),
                  child: SvgPicture.asset(styleSheet.icons.upi)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.r),
                            borderSide:
                                BorderSide(color: styleSheet.colors.gray)),
                        hintText: LanguageConst.addYourUPIID.tr,
                        helperStyle: styleSheet.textTheme.fs14Normal,
                        suffixIcon: SizedBox(
                          height: 44.h,
                          width: 44.w,
                          child: Center(
                            child: SvgPicture.asset(
                              styleSheet.icons.click,
                              height: 30.h,
                              width: 30.w,
                              color: styleSheet.colors.black,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                  styleSheet.services.addheight(15.h),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: SizedBox(
                          width: 150.w,
                          child: PrimaryButton(
                              title: LanguageConst.save.tr,
                              onPressed: () {
                                Get.back();
                              }))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
