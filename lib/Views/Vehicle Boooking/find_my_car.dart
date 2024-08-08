import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Dialogs/filter_dialog.dart';
import 'package:car_booking_customer/Components/TextFields/secondary_text_form_field.dart';
import 'package:car_booking_customer/Components/Tiles/find_car_tile.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FindcarsScreen extends StatelessWidget {
  FindcarsScreen({super.key});

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text(LanguageConst.findMC.tr)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SecondaryTextFormField(
              controller: searchController,
              icon: styleSheet.icons.filter,
              icon2: styleSheet.icons.calender,
              hinttext: LanguageConst.searchFRAC.tr,
              iconOnTap: () {
                Get.dialog(const FilterDialog());
              },
            ),
            styleSheet.services.addheight(15.h),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: GridView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h),
                  itemBuilder: (context, index) => FindCarTile(
                    onPressed: () {
                      Get.toNamed(RoutesName.carPreviewScreen);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
