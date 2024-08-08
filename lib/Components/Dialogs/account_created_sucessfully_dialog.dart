import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountCreatedSucessfullyDialog extends StatelessWidget {
  const AccountCreatedSucessfullyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: WillPopScope(
        onWillPop: () async => true,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              styleSheet.services.addheight(10.h),
              Image.asset(styleSheet.images.kycimage),
              styleSheet.services.addheight(15.h),
              Text(
                LanguageConst.accountCS.tr,
                style: styleSheet.textTheme.fs16Normal,
                textAlign: TextAlign.center,
              ),
              styleSheet.services.addheight(10.h),
              Text(
                LanguageConst.pleaseWwtaytlp.tr,
                style: styleSheet.textTheme.fs12Normal,
              ),
              styleSheet.services.addheight(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
