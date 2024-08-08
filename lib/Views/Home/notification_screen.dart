import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/TextFields/secondary_text_form_field.dart';
import 'package:car_booking_customer/Components/Tiles/notification_tile.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(LanguageConst.notifications.tr),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0.sp).copyWith(top: 0),
            child: Column(
              children: [
                SecondaryTextFormField(
                  controller: searchController,
                  hinttext: LanguageConst.searchFM.tr,
                  icon: styleSheet.icons.search,
                  iconColor: styleSheet.colors.gray,
                  iconOnTap: () {},
                ),
                styleSheet.services.addheight(15.h),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => NotificationTile(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
