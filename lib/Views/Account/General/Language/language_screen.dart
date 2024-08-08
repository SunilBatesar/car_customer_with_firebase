import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/TextFields/secondary_text_form_field.dart';
import 'package:car_booking_customer/Controllers/language_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});
  final languageController = Get.find<LanguageController>();
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text("Language")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SecondaryTextFormField(
                hinttext: LanguageConst.searchForLanguages.tr,
                controller: searchController,
                icon: styleSheet.icons.search,
              iconOnTap: () {},
            ),
          ),
          styleSheet.services.addheight(15.h),
          ...List.generate(LanguageTranslations.languageList.length, (index) {
            final language = LanguageTranslations.languageList[index];
            return RadioListTile(
              value: language,
              groupValue: languageController.languageData,
              onChanged: (v) {
                languageController.setLanguage(v!);
              },
              title: Text(language.languageName,
                  style: styleSheet.textTheme.fs16Normal),
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: styleSheet.colors.black,
            );
          })
        ],
      ),
    );
  }
}
