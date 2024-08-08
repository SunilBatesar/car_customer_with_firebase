import 'package:car_booking_customer/Components/Dialogs/logout_dialog.dart';
import 'package:car_booking_customer/Components/Dialogs/rate_us_dialog.dart';
import 'package:car_booking_customer/Components/Tiles/account_tile.dart';
import 'package:car_booking_customer/Components/Tiles/coustom_profile_tile.dart';
import 'package:car_booking_customer/Data/Localdata/localdata.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Views/BottomNavigationBar/bottom_navigationbar.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              CoustomProfileTile(),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(overscroll: false),
                  child: ListView(
                    children: [
                      styleSheet.services.addheight(15.h),
                      Text(
                        "General",
                        style: styleSheet.textTheme.fs16Normal
                            .copyWith(color: styleSheet.colors.primary),
                      ),
                      styleSheet.services.addheight(10.h),
                      Divider(
                        thickness: 1,
                      ),
                      styleSheet.services.addheight(10.h),
                      ...List.generate(
                        Localdata.generalData.length,
                        (index) => AccountTile(
                            txt: Localdata.generalData[index].title.tr,
                            img: Localdata.generalData[index].icon,
                            onpressed: () {
                              pushto(Localdata.generalData[index].id);
                            }),
                      ),
                      styleSheet.services.addheight(10.h),
                      Text(
                        "Settings & Privacy",
                        style: styleSheet.textTheme.fs16Normal
                            .copyWith(color: styleSheet.colors.primary),
                      ),
                      styleSheet.services.addheight(10.h),
                      Divider(
                        thickness: 1,
                      ),
                      ...List.generate(
                        Localdata.settingsData.length,
                        (index) => AccountTile(
                            txt: Localdata.settingsData[index].title.tr,
                            img: Localdata.settingsData[index].icon,
                            onpressed: () {
                              pushtosetting(Localdata.settingsData[index].id);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

pushto(String id) {
  switch (id) {
    case "profile":
      return Get.toNamed(RoutesName.profile);

    case "myAddress":
      return Get.toNamed(RoutesName.myAddressScreen);
    case "wishlist":
      return Get.toNamed(RoutesName.wishListScreen);
    case "myBookings":
      return Get.offAll(BottomBarScreen(
        currentIndex: 1,
      ));
    case "language":
      return Get.toNamed(RoutesName.languageScreen);
    case "myTransactions":
      return Get.toNamed(RoutesName.transactionScreen);
    case "notifications":
      return Get.toNamed(RoutesName.notificationSettingScreen);

    default:
  }
}

pushtosetting(String type) {
  switch (type) {
    case "Payment":
      return Get.toNamed(RoutesName.paymentMethodScreen);
    case "Privacy":
      return Get.toNamed(RoutesName.privacyAndPolicyScreen);
    case "Term’s":
      return Get.toNamed(RoutesName.termsAndConditionScreen);
    case "FAQ’s":
      return Get.toNamed(RoutesName.faqScreen);
    case "Help":
      return Get.toNamed(RoutesName.helpAndSupportsScreen);
    case "Rate":
      return Get.dialog(RateUsDialog());
    case "Logout":
      return Get.dialog(LogoutDialog());

    default:
  }
}
