import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneSettingPermissionDialog extends StatelessWidget {
  String title;
  Function onTap;
  PhoneSettingPermissionDialog(
      {super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: PrimaryContainer(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Permission Denied", style: styleSheet.textTheme.fs20Normal),
          styleSheet.services.addheight(5),
          Text(title,
              style: styleSheet.textTheme.fs14Normal
                  .copyWith(color: styleSheet.colors.gray)),
          styleSheet.services.addheight(20),
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
                      title: LanguageConst.setting.tr,
                      onPressed: () {
                        onTap();
                        Get.back();
                      })),
            ],
          )
        ],
      )),
    );
  }
}
