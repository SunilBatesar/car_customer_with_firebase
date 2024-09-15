import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Dialogs/payment_dialog.dart';
import 'package:car_booking_customer/Components/Tiles/address_tile.dart';
import 'package:car_booking_customer/Components/cards/bookingcards/book_detail_card.dart';
import 'package:car_booking_customer/Components/cards/bookingcards/bookingtime.dart';
import 'package:car_booking_customer/Components/row_prefixtext_suffixtext.dart';
import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

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
                    BookingDetailCard(
                      model: CarModel(),
                    ),
                    styleSheet.services.addheight(15.h),
                    BookingDetailCard(
                      model: CarModel(),
                    ),
                    styleSheet.services.addheight(15.h),
                    AddressTile(
                      address: "Rishi nagar 90 - S 99 gali 1",
                      destination: "Hansi Gate Sec - 89",
                    ),
                    styleSheet.services.addheight(15.h),
                    BookingTimeCard(),
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
                      suffixtext: "₹ 1,200"),
                  styleSheet.services.addheight(11.h),
                  RowPrefixtextSuffixtext(
                      prefixtext: LanguageConst.modeOfPayment.tr,
                      suffixtext: "cash"),
                  styleSheet.services.addheight(11.h),
                  RowPrefixtextSuffixtext(
                      prefixtext: LanguageConst.couponCodeApplied.tr,
                      suffixtext: "- ₹ 200"),
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
                          "₹ 1000",
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
