import 'dart:async';

import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Utils/app_validators.dart';
import 'package:car_booking_customer/Views/Authentication/Widgets/auth_common_widget.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final usercontroller = Get.find<UserController>();

  final _key = GlobalKey<FormState>();

  // VERIFICATION SCREEN TEXT EDITING  CONTROLLERS
  final verificationcontroller = TextEditingController();

  final Rx<int> _start = 30.obs;

  time() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (_start == 0) {
          timer.cancel();
        } else {
          _start.value--;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    time();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthCommonWidget(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 75.h),
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LanguageConst.verificationS.tr,
              style: styleSheet.textTheme.fs18Normal
                  .copyWith(color: styleSheet.colors.white),
            ),
          ),
          styleSheet.services.addheight(5.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LanguageConst.weHsavcoD.tr,
              style: styleSheet.textTheme.fs16Normal
                  .copyWith(color: styleSheet.colors.white),
            ),
          ),
          styleSheet.services.addheight(20.h),
          Form(
            key: _key,
            child: Pinput(
              length: 5,
              controller: verificationcontroller,
              validator: (value) => TextValidator().validator(value),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              errorTextStyle: styleSheet.textTheme.fs14Normal
                  .copyWith(color: styleSheet.colors.red70),
              defaultPinTheme: PinTheme(
                  height: 64.h,
                  width: 50.w,
                  textStyle: styleSheet.textTheme.fs24Normal,
                  decoration: BoxDecoration(
                      color: styleSheet.colors.white,
                      borderRadius: BorderRadius.circular(5.r))),
            ),
          ),
          styleSheet.services.addheight(15.h),
          Obx(
            () {
              return Column(
                children: [
                  _start.value != 0
                      ? Text(
                          "0.$_start ${LanguageConst.secL.tr}",
                          style: styleSheet.textTheme.fs16Normal
                              .copyWith(color: styleSheet.colors.white),
                        )
                      : TextButton(
                          onPressed: () {},
                          child: Text(
                            LanguageConst.resendOTP.tr,
                            style: styleSheet.textTheme.fs16Normal
                                .copyWith(color: styleSheet.colors.white),
                          ),
                        )
                ],
              );
            },
          ),
          styleSheet.services.addheight(25.h),
          PrimaryButton(
            title: LanguageConst.verify.tr,
            onPressed: () {
              getValideTextField();
            },
            isExpanded: true,
          )
        ],
      ),
    ));
  }

  getValideTextField() {
    if (_key.currentState!.validate()) {
      Get.toNamed(RoutesName.createNewPasswordScreen);
    }
  }
}
