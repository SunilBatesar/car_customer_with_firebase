import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Buttons/second_primary_button.dart';
import 'package:car_booking_customer/Components/Dialogs/upi_dialog.dart';
import 'package:car_booking_customer/Components/Tiles/payment_method_tile.dart';
import 'package:car_booking_customer/Data/Localdata/localdata.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Row(
          children: [
            Expanded(
                child: SecondPrimaryButton(
              icon: styleSheet.icons.card,
              iconColor: styleSheet.colors.black,
              title: LanguageConst.addCard.tr,
              backGroundTransparent: true,
              onPressed: () {
                Get.toNamed(RoutesName.addBankCardScreen);
              },
            )),
            styleSheet.services.addwidth(10.w),
            Expanded(
                child: PrimaryButton(
                    title: LanguageConst.save.tr, onPressed: () {}))
          ],
        ),
      ),
      appBar: CustomAppbar(title: Text(LanguageConst.paymentMethods.tr)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            children: [
              Text(
                LanguageConst.currentMethod.tr,
                style: styleSheet.textTheme.fs16Normal,
                textAlign: TextAlign.left,
              ),
              PaymentMethodTile(
                bordercolor: styleSheet.colors.white,
                onpressed: () {},
                trailingicon: true,
                leadingicon: styleSheet.icons.cash,
                subtitle: LanguageConst.defaultMethod.tr,
                title: LanguageConst.cash.tr,
              ),
              styleSheet.services.addheight(10.h),
              Divider(),
              styleSheet.services.addheight(10.h),
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                LanguageConst.choosYDPMFOPIWYACOAYC.tr,
                style: styleSheet.textTheme.fs14Normal,
              ),
              styleSheet.services.addheight(10.h),
              ListView.builder(
                itemCount: Localdata.categoriesData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => PaymentMethodTile(
                  onpressed: () {
                    setState(() {
                      currentindex = index;
                      currentindex == 2
                          ? Get.dialog(
                              UpiDialog(),
                            )
                          : SizedBox();
                    });
                  },
                  leadingicon: Localdata.categoriesData[index]["icon"],
                  title: Localdata.categoriesData[index]["tittle"],
                  subtitle: Localdata.categoriesData[index]["subtitle"],
                  bordercolor: currentindex == index
                      ? styleSheet.colors.gray
                      : styleSheet.colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
