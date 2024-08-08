import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Tiles/switch_adaptive_prifix_tile.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationSettingScreen extends StatelessWidget {
  const NotificationSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(LanguageConst.notificationSetting.tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp).copyWith(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LanguageConst.inAppNotification.tr,
              style: styleSheet.textTheme.fs16Normal
                  .copyWith(color: styleSheet.colors.gray),
            ),
            styleSheet.services.addheight(15.h),
            SwitchAdaptivePrifixTile(
                title: LanguageConst.getInAppNotification.tr),
            styleSheet.services.addheight(15.h),
            Text(
              LanguageConst.systemNotification.tr,
              style: styleSheet.textTheme.fs16Normal
                  .copyWith(color: styleSheet.colors.gray),
            ),
            styleSheet.services.addheight(15.h),
            SwitchAdaptivePrifixTile(
                title: LanguageConst.getSystemNotification.tr),
            styleSheet.services.addheight(15.h),
            Text(
              LanguageConst.behaviour.tr,
              style: styleSheet.textTheme.fs16Normal
                  .copyWith(color: styleSheet.colors.gray),
            ),
            styleSheet.services.addheight(15.h),
            SwitchAdaptivePrifixTile(title: LanguageConst.allowNTWTD.tr),
            styleSheet.services.addheight(15.h),
            SwitchAdaptivePrifixTile(title: LanguageConst.disableNV.tr),
            styleSheet.services.addheight(15.h),
            SwitchAdaptivePrifixTile(title: LanguageConst.doNotDisturb.tr),
          ],
        ),
      ),
    );
  }
}
