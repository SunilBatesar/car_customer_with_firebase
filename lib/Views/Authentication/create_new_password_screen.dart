import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Dialogs/bank_card_successfully_dialog.dart';
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

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});
  final _key = GlobalKey<FormState>();
  final userController = Get.find<UserController>();
  // CREATE NEW PASSWORD SCREEN TEXT EDITING  CONTROLLERS
  final createNewPasswordController = TextEditingController();
  final createConfirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthCommonWidget(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 75.h),
          widget: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LanguageConst.createNp.tr,
                  style: styleSheet.textTheme.fs24Medium
                      .copyWith(color: styleSheet.colors.white),
                ),
                styleSheet.services.addheight(20.h),
                Text(
                  LanguageConst.pleaseEynpfyas.tr,
                  style: styleSheet.textTheme.fs16Normal
                      .copyWith(color: styleSheet.colors.white),
                ),
                styleSheet.services.addheight(20.h),
                PrimaryTextFormField(
                  controller: createNewPasswordController,
                  validator: PasswordValidator(),
                  title: LanguageConst.newP.tr,
                  hinttext: LanguageConst.enterP.tr,
                  obscureText: true,
                ),
                styleSheet.services.addheight(20.h),
                PrimaryTextFormField(
                  controller: createConfirmPasswordController,
                  validator: PasswordValidator(),
                  title: LanguageConst.confirmP.tr,
                  hinttext: LanguageConst.confirmP.tr,
                  suffixicon: styleSheet.icons.vigible,
                  obscureText: true,
                ),
                styleSheet.services.addheight(20.h),
                PrimaryButton(
                  title: LanguageConst.verify.tr,
                  onPressed: () {
                    getValideTextField();
                  },
                  isExpanded: true,
                ),
              ],
            ),
          )),
    );
  }

  getValideTextField() {
    if (_key.currentState!.validate()) {
      Future.delayed(
          Duration(seconds: 2), () => Get.offNamed(RoutesName.loginScreen));
      Get.dialog(CardSuccessfullyDialog(
        image: styleSheet.images.passwordSuccessfully,
        title: "Password Changed Successfully",
        sbtitle: "please wait we are taking you to login page",
      ));
    }
  }
}
