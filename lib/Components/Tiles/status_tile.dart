import 'package:car_booking_customer/Controllers/payment_address_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class StatusTile extends StatefulWidget {
  const StatusTile({
    super.key,
  });

  @override
  State<StatusTile> createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  final controller = Get.find<PaymentAddressController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Text(
            subtitle(controller.paymentStateValue),
            style: styleSheet.textTheme.fs14Normal
                .copyWith(color: styleSheet.colors.gray),
          ),
        ),
        styleSheet.services.addheight(15.h),
        Container(
          width: styleSheet.services.screenWidth(context),
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
              color: styleSheet.colors.white,
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  LanguageConst.car.tr,
                  style: controller.paymentStateValue == PaymentState.CAR
                      ? styleSheet.textTheme.fs16Normal
                      : styleSheet.textTheme.fs14Normal
                          .copyWith(color: styleSheet.colors.lightgray),
                ),
              ),
              SvgPicture.asset(
                styleSheet.icons.rightArrow,
                color: controller.paymentStateValue == PaymentState.CAR
                    ? styleSheet.colors.black
                    : styleSheet.colors.lightgray,
                height: 15.sp,
                width: 15.sp,
              ),
              Text(
                LanguageConst.addAddress.tr,
                style: controller.paymentStateValue == PaymentState.ADDRESS
                    ? styleSheet.textTheme.fs16Normal
                    : styleSheet.textTheme.fs14Normal
                        .copyWith(color: styleSheet.colors.lightgray),
              ),
              SvgPicture.asset(
                styleSheet.icons.rightArrow,
                color: controller.paymentStateValue == PaymentState.ADDRESS
                    ? styleSheet.colors.black
                    : styleSheet.colors.lightgray,
                height: 15.sp,
                width: 15.sp,
              ),
              Text(
                LanguageConst.payment.tr,
                style: controller.paymentStateValue == PaymentState.PAYMENT
                    ? styleSheet.textTheme.fs16Normal
                    : styleSheet.textTheme.fs14Normal
                        .copyWith(color: styleSheet.colors.lightgray),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String subtitle(PaymentState state) {
    switch (state) {
      case PaymentState.CAR:
        return LanguageConst.herAYSCFTBIWASTWLSYCBLE.tr;
      case PaymentState.ADDRESS:
        return LanguageConst.fillOrSelectLocation.tr;
      case PaymentState.PAYMENT:
        return LanguageConst.hereIYBRFASV.tr;
      default:
        return "";
    }
  }
}
