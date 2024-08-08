import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Dialogs/payment_dialog.dart';
import 'package:car_booking_customer/Components/Tiles/status_tile.dart';
import 'package:car_booking_customer/Controllers/payment_address_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:car_booking_customer/Views/Payment%20and%20Address/Widgets/address_widget.dart';
import 'package:car_booking_customer/Views/Payment%20and%20Address/Widgets/car_widget.dart';
import 'package:car_booking_customer/Views/Payment%20and%20Address/Widgets/payment_widget.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  double height = 60;

  final controller = Get.find<PaymentAddressController>();

  @override
  Widget build(BuildContext context) {
    String titleName() {
      switch (controller.paymentStateValue) {
        case PaymentState.CAR:
          return LanguageConst.wishList.tr;
        case PaymentState.ADDRESS:
          return LanguageConst.addAddress.tr;
        case PaymentState.PAYMENT:
          return LanguageConst.payment.tr;
        default:
          return "";
      }
    }

    return Scaffold(
      appBar: CustomAppbar(
        title: Obx(
          () => Text(titleName()),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatusTile(),
              styleSheet.services.addheight(15.h),
              Expanded(child: stateManage(controller.paymentStateValue)),
              styleSheet.services.addheight(15.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.sp).copyWith(top: 0),
        child: Row(
          children: [
            PrimaryButton(
              title: LanguageConst.cancel.tr,
              onPressed: () {
                if (controller.paymentStateValue == PaymentState.PAYMENT) {
                  controller.setpaymentStateValue(PaymentState.ADDRESS);
                } else if (controller.paymentStateValue ==
                    PaymentState.ADDRESS) {
                  controller.setpaymentStateValue(PaymentState.CAR);
                } else {
                  controller.setpaymentStateValue(PaymentState.CAR);
                  Get.back();
                }
                setState(() {});
              },
              backGroundTransparent: true,
            ),
            styleSheet.services.addwidth(20.w),
            Expanded(
              child: PrimaryButton(
                title: LanguageConst.continueText.tr,
                onPressed: () {
                  if (controller.paymentStateValue == PaymentState.CAR) {
                    controller.setpaymentStateValue(PaymentState.ADDRESS);
                  } else if (controller.paymentStateValue ==
                      PaymentState.ADDRESS) {
                    controller.setpaymentStateValue(PaymentState.PAYMENT);
                  } else {
                    Future.delayed(Duration(seconds: 3), () => Get.back());
                    Get.dialog(PaymentDialog());
                  }
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget stateManage(PaymentState state) {
    switch (state) {
      case PaymentState.CAR:
        return CarWidget();
      case PaymentState.ADDRESS:
        return AddressWidget();
      case PaymentState.PAYMENT:
        return PaymentWidget();
      default:
        return Scaffold();
    }
  }
}
