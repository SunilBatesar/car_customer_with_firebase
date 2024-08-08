import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/TextFields/primary_text_form_field.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Utils/app_validators.dart';
import 'package:car_booking_customer/Views/Authentication/Widgets/auth_common_widget.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});
  final _key = GlobalKey<FormState>();
  // FORGOT PASSWORD SCREEN TEXT EDITING  CONTROLLERS
  final emailController = TextEditingController();
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthCommonWidget(
          padding:
              EdgeInsets.only(bottom: 10.h, top: 88.h, right: 20.w, left: 20.w),
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanguageConst.forgotPassword.tr,
                style: styleSheet.textTheme.fs24Medium
                    .copyWith(color: styleSheet.colors.white),
              ),
              styleSheet.services.addheight(20.h),
              Text(
                LanguageConst.pleaseEyemoWcsytvc.tr,
                style: styleSheet.textTheme.fs16Normal
                    .copyWith(color: styleSheet.colors.white),
              ),
              styleSheet.services.addheight(20.h),
              Form(
                key: _key,
                child: PrimaryTextFormField(
                  controller: emailController,
                  validator: EmailValidator(),
                  title: LanguageConst.emailOrMobile.tr,
                  hinttext: LanguageConst.enterUEOM.tr,
                  suffixicon: styleSheet.icons.mail,
                ),
              ),
              styleSheet.services.addheight(20.h),
              PrimaryButton(
                title: LanguageConst.continueText.tr,
                onPressed: () {
                  getValideTextField();
                },
                isExpanded: true,
              ),
              styleSheet.services.addheight(40.h),
              Align(
                alignment: Alignment.center,
                child: TextButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: styleSheet.colors.white,
                    ),
                    label: Text(
                      LanguageConst.backToLogin.tr,
                      style: styleSheet.textTheme.fs16Normal
                          .copyWith(color: styleSheet.colors.white),
                    )),
              )
            ],
          )),
    );
  }

  getValideTextField() {
    if (_key.currentState!.validate()) {
      Get.toNamed(RoutesName.verificationScreen);
    }
  }
}
