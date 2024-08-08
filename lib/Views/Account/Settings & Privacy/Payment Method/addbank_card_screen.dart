import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Buttons/second_primary_button.dart';
import 'package:car_booking_customer/Components/Constants/app_images.dart';
import 'package:car_booking_customer/Components/Dialogs/bank_card_successfully_dialog.dart';
import 'package:car_booking_customer/Components/TextFields/primary_text_form_field.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddBankCardScreen extends StatelessWidget {
  AddBankCardScreen({super.key});
  final cardcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text(LanguageConst.addBankCard.tr)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.sp).copyWith(top: 0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          side: BorderSide(color: styleSheet.colors.gray)),
                      leading: Icon(
                        Icons.add_card_rounded,
                        size: 24.sp,
                      ),
                      title: Text(
                        LanguageConst.addNewCard.tr,
                        style: styleSheet.textTheme.fs18Normal,
                      ),
                      subtitle: Text(
                        LanguageConst.streamlineCheckoutProcess.tr,
                        style: styleSheet.textTheme.fs12Normal
                            .copyWith(color: styleSheet.colors.gray),
                      ),
                      trailing: Icon(
                        Icons.clear_outlined,
                        size: 24.sp,
                      ),
                    ),
                    styleSheet.services.addheight(15.h),
                    PrimaryTextFormField(
                      controller: cardcontroller,
                      hinttext: "0000 0000 0000 0000",
                      suffixicon: AppIcons().wallet,
                      title: LanguageConst.cardNo.tr,
                      titleColor: styleSheet.colors.black,
                    ),
                    styleSheet.services.addheight(15.h),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryTextFormField(
                            controller: cardcontroller,
                            hinttext: LanguageConst.mmyy.tr,
                            suffixicon: AppIcons().calender,
                            title: LanguageConst.expiresOn.tr,
                            titleColor: styleSheet.colors.black,
                          ),
                        ),
                        styleSheet.services.addwidth(15.w),
                        Expanded(
                          child: PrimaryTextFormField(
                            controller: cardcontroller,
                            hinttext: "........",
                            suffixicon: AppIcons().wallet,
                            title: LanguageConst.cvv.tr,
                            titleColor: styleSheet.colors.black,
                          ),
                        ),
                      ],
                    ),
                    styleSheet.services.addheight(15.h),
                    PrimaryTextFormField(
                      controller: cardcontroller,
                      hinttext: LanguageConst.enterCardholdersFullName.tr,
                      suffixicon: AppIcons().person,
                      title: LanguageConst.cardholdersName.tr,
                      titleColor: styleSheet.colors.black,
                    ),
                  ],
                ),
              ),
              SecondPrimaryButton(
                title: LanguageConst.addMycard.tr,
                onPressed: () {
                  Future.delayed(Duration(seconds: 3), () => Get.back());
                  Get.dialog(CardSuccessfullyDialog(
                    image: styleSheet.images.bankCardAddedSuccessfully,
                    title: LanguageConst.bankCardAddedSuccessfully.tr,
                    sbtitle: LanguageConst.pleaseWaitForDetails.tr,
                  ));
                },
                icon: styleSheet.icons.card,
                isExpanded: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
