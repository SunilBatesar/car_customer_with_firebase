import 'package:car_booking_customer/Classes/manage_data.dart';
import 'package:car_booking_customer/Components/Dialogs/filter_dialog.dart';
import 'package:car_booking_customer/Components/TextFields/primary_text_form_field.dart';
import 'package:car_booking_customer/Components/Tiles/bookingcar_tile.dart';
import 'package:car_booking_customer/Controllers/booking_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final seachController = TextEditingController();

  final bookingController = Get.find<BookingController>(); // BOOKING CONTROLLER
  @override
  Widget build(BuildContext context) {
    final manageData = ConstantSheet.instance;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.h, right: 15.h, top: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LanguageConst.bookings.tr,
                style: manageData.textTheme.fs24Normal,
              ),
              styleSheet.services.addheight(15.h),
              Row(
                children: [
                  Expanded(
                      child: PrimaryTextFormField(
                          controller: seachController,
                          hinttext: LanguageConst.searchForBookings.tr)),
                  styleSheet.services.addwidth(15.w),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return FilterDialog();
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: manageData.colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.filter_list),
                    ),
                  ),
                ],
              ),
              styleSheet.services.addheight(15.h),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(overscroll: false),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: bookingController.bookingData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.7,
                        crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      return BookingsCarTile(
                        model: bookingController.bookingData[index],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
