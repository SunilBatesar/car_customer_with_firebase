import 'dart:async';

import 'package:car_booking_customer/Classes/manage_data.dart';
import 'package:car_booking_customer/Controllers/app_initialbinding.dart';
import 'package:car_booking_customer/Preferences/sharedpreferences.dart';
import 'package:car_booking_customer/Res/Services/appconfig.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

late ConstantSheet styleSheet;
SharedPrefs prefs = SharedPrefs.instance;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.getpref();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        styleSheet = ConstantSheet.instance;
        return GetMaterialApp(
          locale: LanguageTranslations.locale,
          fallbackLocale: LanguageTranslations.locale,
          translations: LanguageTranslations(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: false,
              scaffoldBackgroundColor: styleSheet.colors.bgclr),
          getPages: appRoutes,
          initialRoute: RoutesName.splashScreen,
          initialBinding: AppInitialbinding(),
        );
      },
      designSize: Size(AppConfig.screenWidth, AppConfig.screenHeight),
    );
  }
}
