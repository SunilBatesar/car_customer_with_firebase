import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/TextFields/primary_text_form_field.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Utils/app_validators.dart';
import 'package:car_booking_customer/Views/Authentication/Widgets/auth_common_widget.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usercontroller = Get.find<UserController>();

  final _key = GlobalKey<FormState>();

  final userController = Get.find<UserController>();

  // LOGIN SCREEN TEXT EDITING  CONTROLLERS
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  var arg = Get.arguments;

  bool passwordShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthCommonWidget(
          widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: SvgPicture.asset(styleSheet.images.Applogo)),
          styleSheet.services.addheight(25.h),
          Text(
            LanguageConst.welcome.tr,
            style: styleSheet.textTheme.fs18Normal
                .copyWith(color: styleSheet.colors.white),
          ),
          styleSheet.services.addheight(5.h),
          Text(
            LanguageConst.gladTSy.tr,
            style: styleSheet.textTheme.fs24Normal
                .copyWith(color: styleSheet.colors.white),
          ),
          styleSheet.services.addheight(15.h),
          Form(
              key: _key,
              child: Column(children: [
                PrimaryTextFormField(
                  controller: emailController,
                  keyboardtype: TextInputType.emailAddress,
                  validator: EmailValidator(),
                  title: LanguageConst.userE.tr,
                  hinttext: LanguageConst.enterUE.tr,
                  suffixicon: styleSheet.icons.person,
                ),
                styleSheet.services.addheight(15.h),
                PrimaryTextFormField(
                  controller: passwordController,
                  validator: PasswordValidator(),
                  title: LanguageConst.password.tr,
                  hinttext: LanguageConst.enterP.tr,
                  obscureText: passwordShow,
                  suffixiconOnTap: () {
                    setState(() {
                      passwordShow = !passwordShow;
                    });
                  },
                  suffixicon: passwordShow
                      ? styleSheet.icons.noVigible
                      : styleSheet.icons.vigible,
                ),
              ])),
          styleSheet.services.addheight(30.h),
          GetBuilder<UserController>(
              builder: (controller) => PrimaryButton(
                    title: LanguageConst.login.tr,
                    onPressed: () {
                      _getValideTextField();
                    },
                    isExpanded: true,
                    isloading: controller.userdata.state == DataState.ISLOADING
                        ? true
                        : false,
                  )),
          styleSheet.services.addheight(30.h),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RoutesName.forgetScreen);
              },
              child: Text(
                LanguageConst.forgotP.tr,
                style: styleSheet.textTheme.fs16Normal
                    .copyWith(color: styleSheet.colors.white),
              ),
            ),
          ),
          styleSheet.services.addheight(30.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  color: styleSheet.colors.gray,
                ),
              ),
              styleSheet.services.addwidth(10.w),
              Text(
                LanguageConst.or.tr,
                style: styleSheet.textTheme.fs14Normal
                    .copyWith(color: styleSheet.colors.white),
              ),
              styleSheet.services.addwidth(10.w),
              Expanded(
                child: Divider(
                  color: styleSheet.colors.gray,
                ),
              ),
            ],
          ),
          styleSheet.services.addheight(30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  height: 30.sp,
                  width: 30.sp,
                  styleSheet.icons.fb,
                  fit: BoxFit.cover,
                ),
              ),
              styleSheet.services.addwidth(30.w),
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  height: 30.sp,
                  width: 30.sp,
                  styleSheet.icons.google,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          styleSheet.services.addheight(30.h),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(RoutesName.personalDetailScreen);
              },
              child: Text(
                LanguageConst.newTRRn.tr,
                style: styleSheet.textTheme.fs14Normal
                    .copyWith(color: styleSheet.colors.white),
              ),
            ),
          ),
        ],
      )),
    );
  }

  _getValideTextField() async {
    if (_key.currentState!.validate()) {
      await userController.login({
        "email": emailController.text,
        "password": passwordController.text,
      });
      Get.offNamed(RoutesName.bottombarScreen);
    }
  }
}
