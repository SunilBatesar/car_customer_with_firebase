import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Tiles/help_support_tile.dart';
import 'package:car_booking_customer/Data/Localdata/localdata.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HelpAndSupportsScreen extends StatelessWidget {
  const HelpAndSupportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text(LanguageConst.helpAndSupport.tr)),
      body: Padding(
        padding: EdgeInsets.all(15.sp).copyWith(top: 0),
        child: Column(
          children: [
            Text(
              LanguageConst.youCCOEASFYCAH.tr,
              style: styleSheet.textTheme.fs14Normal,
            ),
            styleSheet.services.addheight(15.h),
            ...List.generate(
                Localdata.helpandSupportData.length,
                (index) => HelpSupportTile(
                      onPressed: () {
                        pushto(Localdata.helpandSupportData[index].id);
                      },
                      prefixicon:
                          Localdata.helpandSupportData[index].prefixicon,
                      title: Localdata.helpandSupportData[index].title.tr,
                    ).paddingOnly(bottom: 15.sp))
          ],
        ),
      ),
    );
  }
}

pushto(String id) {
  switch (id) {
    case "CustomerServices":
      return Get.toNamed(RoutesName.customerServicesScreen);
    case "whatsapp":
      return null;
    case "DeleteAccount":
      return Get.toNamed(RoutesName.deleteaccountScreen);
    case "AddNewAddress":
      return null;

    default:
  }
}
