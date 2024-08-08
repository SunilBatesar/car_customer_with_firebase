import 'dart:io';

import 'package:car_booking_customer/Components/Bottom%20Sheets/image_pick_bottomsheet.dart';
import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Dialogs/account_created_sucessfully_dialog.dart';
import 'package:car_booking_customer/Components/DropdownButtons/dropdown_button_title.dart';
import 'package:car_booking_customer/Components/TextFields/primary_text_form_field.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Utils/app_validators.dart';
import 'package:car_booking_customer/Utils/utils.dart';
import 'package:car_booking_customer/Views/Authentication/Widgets/auth_common_widget.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class KyclDetailScreen extends StatefulWidget {
  const KyclDetailScreen({super.key});

  @override
  State<KyclDetailScreen> createState() => _KyclDetailScreenState();
}

class _KyclDetailScreenState extends State<KyclDetailScreen> {
  final TextEditingController datecontrollers = TextEditingController();
  final usercontroller = Get.find<UserController>();

  final _key = GlobalKey<FormState>();
  final phonecontroller = TextEditingController();
  final userController = Get.find<UserController>();
  final _selectDocument = [
    "Adhar Card",
    "Pan Card",
    "Driving Licence",
  ];
  String? documentvalue;
  DateTime selectedDate = DateTime.now();

  // File

  File? documentFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthCommonWidget(
          widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConst.kycD.tr,
                style: styleSheet.textTheme.fs24Normal
                    .copyWith(color: styleSheet.colors.white),
              ),
              TextButton(
                  onPressed: () {
                    Future.delayed(Duration(seconds: 1),
                        () => Get.offNamed(RoutesName.loginScreen));
                    Get.dialog(AccountCreatedSucessfullyDialog());
                  },
                  child: Text(
                    LanguageConst.skip.tr,
                    style: styleSheet.textTheme.fs16Normal
                        .copyWith(color: styleSheet.colors.white),
                  ))
            ],
          ),
          styleSheet.services.addheight(5.h),
          Text(
            LanguageConst.pleaseFaRdfR.tr,
            style: styleSheet.textTheme.fs16Normal
                .copyWith(color: styleSheet.colors.white),
          ),
          styleSheet.services.addheight(15.h),
          DropdownButtonTitle(
              title: LanguageConst.documentT.tr,
              items: _selectDocument,
              onvalue: documentvalue,
              hint: LanguageConst.selectYdt.tr,
              onChangedvalue: (v) {
                setState(() {
                  documentvalue = v;
                });
              }),
          styleSheet.services.addheight(15.h),
          Form(
            key: _key,
            child: Column(
              children: [
                PrimaryTextFormField(
                  controller: phonecontroller,
                  title: LanguageConst.documentN.tr,
                  hinttext: LanguageConst.fillYpdn.tr,
                  suffixicon: styleSheet.icons.click,
                  validator: TextValidator(),
                ),
                styleSheet.services.addheight(15.h),
                PrimaryTextFormField(
                  controller: datecontrollers,
                  validator: TextValidator(),
                  title: LanguageConst.documentED.tr,
                  hinttext: "00/00/00 ",
                  suffixicon: styleSheet.icons.calender,
                  readOnly: true,
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101));
                    if (picked != null) {
                      setState(() {
                        datecontrollers.text =
                            "${picked.toLocal()}".split(" ")[0];
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          styleSheet.services.addheight(15.h),
          Text(
            LanguageConst.uploadDmax50mb.tr,
            style: styleSheet.textTheme.fs16Normal
                .copyWith(color: styleSheet.colors.white),
          ),
          styleSheet.services.addheight(15.h),
          GestureDetector(
            onTap: () {
              Get.bottomSheet(ImagePickBottomsheet(
                title: LanguageConst.uploadDocument.tr,
                file: (file) {
                  if (file.path.isNotEmpty) {
                    setState(() {
                      documentFile = file;
                    });
                  }
                },
              ));
            },
            child: PrimaryContainer(
              height: documentFile != null ? 150.h : 80.h,
              child: documentFile != null
                  ? Image.file(
                      documentFile!,
                      fit: BoxFit.cover,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(styleSheet.icons.download),
                        styleSheet.services.addheight(10.h),
                        Text.rich(TextSpan(
                            text: LanguageConst.uploadDocument.tr,
                            style: styleSheet.textTheme.fs12Normal,
                            children: <TextSpan>[
                              TextSpan(
                                  text: " ${LanguageConst.browse.tr}",
                                  style:
                                      TextStyle(color: styleSheet.colors.blue))
                            ])),
                      ],
                    ),
            ),
          ),
          styleSheet.services.addheight(50.h),
          PrimaryButton(
            title: LanguageConst.save.tr,
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
      if (datecontrollers.text.isNotEmpty && documentvalue != null) {
        Future.delayed(
            Duration(seconds: 1), () => Get.offNamed(RoutesName.loginScreen));
        Get.dialog(AccountCreatedSucessfullyDialog());
      } else {
        Utils.erroSnakeBar("Please enter field");
      }
    }
  }
}
