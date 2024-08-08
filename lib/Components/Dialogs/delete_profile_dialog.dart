import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DeleteProfileDialog extends StatelessWidget {
  const DeleteProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(styleSheet.images.deleteprofile),
            Text(
              LanguageConst.areYouSure.tr,
              style: styleSheet.textTheme.fs18Medium
                  .copyWith(color: styleSheet.colors.red),
            ),
            styleSheet.services.addheight(15.h),
            Text(
              LanguageConst.youWTDYAP.tr,
              style: styleSheet.textTheme.fs14Normal,
              textAlign: TextAlign.center,
            ),
            styleSheet.services.addheight(15.h),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                  text: LanguageConst.ensuringTTUUCTDTALD.tr,
                  style: styleSheet.textTheme.fs12Normal
                      .copyWith(color: styleSheet.colors.gray),
                  children: const [
                    // TextSpan(
                    //     text: "( loss of Data )",
                    //     style: styleSheet.textTheme.fs14Normal
                    //         .copyWith(color: styleSheet.colors.darkgray))
                  ]),
            ),
            styleSheet.services.addheight(15.h),
            Row(
              children: [
                Expanded(
                    child: PrimaryButton(
                  title: LanguageConst.deleteAccount.tr,
                  backGroundTransparent: true,
                  onPressed: () {
                    Get.toNamed(RoutesName.addBankCardScreen);
                  },
                )),
                styleSheet.services.addwidth(10.w),
                Expanded(
                    child: PrimaryButton(
                  title: LanguageConst.keepAccount.tr,
                  onPressed: () {},
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
