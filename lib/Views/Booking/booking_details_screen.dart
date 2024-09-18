import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Dialogs/payment_dialog.dart';
import 'package:car_booking_customer/Components/Tiles/address_tile.dart';
import 'package:car_booking_customer/Components/cards/bookingcards/book_detail_card.dart';
import 'package:car_booking_customer/Components/cards/bookingcards/bookingtime.dart';
import 'package:car_booking_customer/Components/row_prefixtext_suffixtext.dart';
import 'package:car_booking_customer/Models/booking_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingDetailsScreen extends StatelessWidget {
  BookingDetailsScreen({super.key});
  final bookingData = Get.arguments["model"] as BookingModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(LanguageConst.bookingDetails.tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.sp).copyWith(top: 0),
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: ListView(
                  children: [
                    ListView.builder(
                        itemCount: bookingData.cars!.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return BookingDetailCard(
                            model: bookingData.cars![index],
                            increaseDecreaseButton: false,
                          ).paddingOnly(bottom: 10.h);
                        }),
                    styleSheet.services.addheight(15.h),
                    AddressTile(
                      address: bookingData.address ?? "",
                      destination: bookingData.destination ?? "",
                    ),
                    styleSheet.services.addheight(15.h),
                    BookingTimeCard(
                      date: DateFormat("dd/MM/yyyy")
                          .format(DateTime.parse(bookingData.date!)),
                      time: DateFormat("hh:mm a")
                          .format(DateTime.parse(bookingData.time!)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                children: [
                  RowPrefixtextSuffixtext(
                      prefixtext: LanguageConst.amount.tr,
                      suffixtext: "₹ ${bookingData.amount}"),
                  styleSheet.services.addheight(11.h),
                  RowPrefixtextSuffixtext(
                      prefixtext: LanguageConst.modeOfPayment.tr,
                      suffixtext: "${bookingData.paymentType}"),
                  styleSheet.services.addheight(11.h),
                  RowPrefixtextSuffixtext(
                      prefixtext: LanguageConst.couponCodeApplied.tr,
                      suffixtext: "- ₹ 0"),
                  styleSheet.services.addheight(11.h),
                  Divider(
                    color: styleSheet.colors.gray,
                  ),
                  styleSheet.services.addheight(11.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          LanguageConst.totalAmount.tr,
                          style: styleSheet.textTheme.fs16Normal
                              .copyWith(color: styleSheet.colors.gray),
                        ),
                        styleSheet.services.addheight(3.h),
                        Text(
                          "₹ ${bookingData.amount}",
                          style: styleSheet.textTheme.fs16Bold,
                        ),
                      ],
                    ),
                  ),
                  styleSheet.services.addheight(15.h),
                  Row(
                    children: [
                      PrimaryButton(
                        title: LanguageConst.cancel.tr,
                        onPressed: () {},
                        backGroundTransparent: true,
                      ),
                      styleSheet.services.addwidth(20.w),
                      Expanded(
                        child: PrimaryButton(
                          title: LanguageConst.payNow.tr,
                          onPressed: () {
                            Future.delayed(
                              Duration(seconds: 3),
                              () => Get.back(),
                            );
                            showDialog(
                              context: context,
                              builder: (context) => PaymentDialog(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
