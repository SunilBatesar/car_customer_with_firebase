import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/DropdownButtons/dropdown_button_title.dart';
import 'package:car_booking_customer/Components/TextFields/primary_text_form_field.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Utils/app_validators.dart';
import 'package:car_booking_customer/Utils/utils.dart';
import 'package:car_booking_customer/Views/Authentication/Widgets/auth_common_widget.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressDetailScreen extends StatefulWidget {
  const AddressDetailScreen({super.key});

  @override
  State<AddressDetailScreen> createState() => _AddressDetailScreenState();
}

class _AddressDetailScreenState extends State<AddressDetailScreen> {
  final usercontroller = Get.find<UserController>();

  final _key = GlobalKey<FormState>();
  //Postal controller
  final postalController = TextEditingController();
  final addresscontroller = TextEditingController();
  final streetaddresscontroller = TextEditingController();
  final userController = Get.find<UserController>();

  final _selectcity = ["Hisar", "Hansi", "Jind", "Rohtak"];
  final _selectState = ["Haryana", "Punjab", "Rajsthan", "Goa"];
  final _selectCountry = ["India", "China", "Pakistan", "Russia"];
  String? cityvalue;
  String? statevalue;
  String? countryvalue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthCommonWidget(
          widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LanguageConst.addressD.tr,
            style: styleSheet.textTheme.fs24Normal
                .copyWith(color: styleSheet.colors.white),
          ),
          styleSheet.services.addheight(15.h),
          Text(
            LanguageConst.pleaseFaanaD.tr,
            style: styleSheet.textTheme.fs14Normal
                .copyWith(color: styleSheet.colors.white),
          ),
          styleSheet.services.addheight(15.h),
          Form(
            key: _key,
            child: Column(
              children: [
                PrimaryTextFormField(
                  controller: addresscontroller,
                  title: LanguageConst.title.tr,
                  hinttext: LanguageConst.enterTfyA.tr,
                  validator: TextValidator(),
                ),
                styleSheet.services.addheight(15.h),
                PrimaryTextFormField(
                  controller: streetaddresscontroller,
                  validator: TextValidator(),
                  title: LanguageConst.streetA.tr,
                  hinttext: LanguageConst.fillYsa.tr,
                  suffixicon: styleSheet.icons.location,
                ),
                styleSheet.services.addheight(15.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownButtonTitle(
                          title: LanguageConst.city.tr,
                          items: _selectcity,
                          onvalue: cityvalue,
                          hint: LanguageConst.select.tr,
                          onChangedvalue: (v) {
                            setState(() {
                              cityvalue = v;
                            });
                          }),
                    ),
                    styleSheet.services.addwidth(15.w),
                    Expanded(
                      child: DropdownButtonTitle(
                          title: LanguageConst.state.tr,
                          items: _selectState,
                          onvalue: statevalue,
                          hint: LanguageConst.select.tr,
                          onChangedvalue: (v) {
                            setState(() {
                              statevalue = v;
                            });
                          }),
                    ),
                  ],
                ),
                styleSheet.services.addheight(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownButtonTitle(
                          title: LanguageConst.country.tr,
                          items: _selectCountry,
                          onvalue: countryvalue,
                          hint: LanguageConst.select.tr,
                          onChangedvalue: (v) {
                            setState(() {
                              countryvalue = v;
                            });
                          }),
                    ),
                    styleSheet.services.addwidth(15.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LanguageConst.postalC.tr,
                            style: styleSheet.textTheme.fs14Normal
                                .copyWith(color: styleSheet.colors.white),
                          ),
                          styleSheet.services.addheight(10.w),
                          TextFormField(
                            controller: postalController,
                            validator: (value) =>
                                TextValidator().validator(value),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16.h, horizontal: 5.w),
                                filled: true,
                                hintText: LanguageConst.enterField.tr,
                                hintStyle: styleSheet.textTheme.fs16Normal
                                    .copyWith(color: styleSheet.colors.gray),
                                fillColor: styleSheet.colors.white,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.r))),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          styleSheet.services.addheight(15.h),
          PrimaryButton(
            title: LanguageConst.next.tr,
            onPressed: () {
              _getValideTextField();
            },
            isExpanded: true,
          ),
        ],
      )),
    );
  }

  _getValideTextField() {
    if (_key.currentState!.validate()) {
      if (cityvalue != null && statevalue != null && countryvalue != null) {
        final data = userController.userdata.data!.copyWith(
          titleAddress: addresscontroller.text.trim(),
          streetaddress: streetaddresscontroller.text.trim(),
          country: countryvalue,
          state: statevalue,
          city: cityvalue,
          postalcode: postalController.text.trim(),
        );
        userController.setUserData(data);
        Get.toNamed(RoutesName.kyclDetailScreen);
      } else {
        Utils.erroSnakeBar("Please enter field");
      }
    }
  }
}
