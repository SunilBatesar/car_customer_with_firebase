import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Dialogs/payment_dialog.dart';
import 'package:car_booking_customer/Components/TextFields/secondary_text_form_field.dart';
import 'package:car_booking_customer/Components/Tiles/transaction_tile.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({super.key});

  TextEditingController textfieldcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(LanguageConst.transaction.tr),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp).copyWith(top: 0),
        child: Column(
          children: [
            SecondaryTextFormField(
              hinttext: LanguageConst.searchForTransactions.tr,
              controller: textfieldcontroller,
              icon: styleSheet.icons.upDownArrow,
              icon2: styleSheet.icons.calender,
              iconColor: styleSheet.colors.lightgray,
              iconOnTap: () {},
              icon2OnTap: () {},
            ),
            styleSheet.services.addheight(15.h),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      styleSheet.services.addheight(15.h),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => Transactiontile(
                    onTap: () {
                      Future.delayed(
                        Duration(seconds: 3),
                        () => Get.back(),
                      );
                      showDialog(
                          context: context,
                          builder: (context) => PaymentDialog());
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
