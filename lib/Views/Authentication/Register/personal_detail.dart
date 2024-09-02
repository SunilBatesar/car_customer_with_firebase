// ignore_for_file: unused_field

import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/TextFields/primary_text_form_field.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Models/user_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Utils/app_validators.dart';
import 'package:car_booking_customer/Views/Authentication/Widgets/auth_common_widget.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalDetailScreen extends StatelessWidget {
  PersonalDetailScreen({super.key});

  final _key = GlobalKey<FormState>();
  final userController = Get.find<UserController>();
  // ADDRESS CONTROLLER//
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  // PASSWORD ICON VALUE
  RxBool passwordshowBool = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthCommonWidget(
          widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LanguageConst.personalD.tr,
            style: styleSheet.textTheme.fs24Normal
                .copyWith(color: styleSheet.colors.white),
          ),
          styleSheet.services.addheight(15.h),
          Text(
            LanguageConst.pleaseFaRdfR.tr,
            style: styleSheet.textTheme.fs16Normal
                .copyWith(color: styleSheet.colors.white),
          ),
          styleSheet.services.addheight(15.h),
          Form(
            key: _key,
            child: Column(
              children: [
                PrimaryTextFormField(
                  controller: namecontroller,
                  title: LanguageConst.name.tr,
                  hinttext: LanguageConst.enterN.tr,
                  suffixicon: styleSheet.icons.person,
                  validator: TextValidator(),
                ),
                styleSheet.services.addheight(15.h),
                PrimaryTextFormField(
                  controller: phonecontroller,
                  // validator: PhoneNumberValidator(),
                  title: LanguageConst.phoneN.tr,
                  hinttext: LanguageConst.enterYpn.tr,
                  suffixicon: styleSheet.icons.phone,
                  keyboardtype: TextInputType.phone,
                ),
                styleSheet.services.addheight(15.h),
                PrimaryTextFormField(
                  controller: emailcontroller,
                  validator: EmailValidator(),
                  title: LanguageConst.email.tr,
                  hinttext: LanguageConst.enterYe.tr,
                  suffixicon: styleSheet.icons.mail,
                  keyboardtype: TextInputType.emailAddress,
                ),
                styleSheet.services.addheight(15.h),
                Obx(
                  () => PrimaryTextFormField(
                    controller: passwordcontroller,
                    validator: PasswordValidator(),
                    title: LanguageConst.password.tr,
                    hinttext: LanguageConst.enterP.tr,
                    suffixicon: passwordshowBool.value
                        ? styleSheet.icons.noVigible
                        : styleSheet.icons.vigible,
                    obscureText: passwordshowBool.value,
                    suffixiconOnTap: () {
                      passwordshowBool.value = !passwordshowBool.value;
                    },
                  ),
                )
              ],
            ),
          ),
          styleSheet.services.addheight(50.h),
          PrimaryButton(
            title: LanguageConst.next.tr,
            onPressed: () async {
              await _getValideTextField();
            },
            isExpanded: true,
          ),
        ],
      )),
    );
  }

  _getValideTextField() async {
    if (_key.currentState!.validate()) {
      final data = UserModel(
        name: namecontroller.text.trim(),
        phonenumber: phonecontroller.text.trim(),
        email: emailcontroller.text.trim(),
      );
      userController.setUserData(data);
      userController.setPassword(passwordcontroller.text.trim());

      Get.toNamed(RoutesName.addressDetailScreen);
    }
  }
}
