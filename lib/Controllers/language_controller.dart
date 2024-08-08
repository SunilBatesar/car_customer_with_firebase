import 'package:car_booking_customer/Models/language_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  LanguageController() {
    setLanguage(prefs.getLanguagePrefe());
  }
  final Rx<LanguageModel> _languageData = LanguageTranslations.englishUS.obs;
  LanguageModel get languageData => _languageData.value;
  setLanguage(LanguageModel model) {
    final localevalue = Locale(model.languageCode, model.countryCode);
    Get.updateLocale(localevalue);
    _languageData(model);
    prefs.setLanguagePrefe(model: model);
  }
}
