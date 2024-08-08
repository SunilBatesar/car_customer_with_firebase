import 'package:car_booking_customer/Components/row_prefixtext_suffixtext.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: styleSheet.colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    LanguageConst.transactionID.tr,
                    style: styleSheet.textTheme.fs14Normal
                        .copyWith(color: styleSheet.colors.gray),
                  ),
                ),
                styleSheet.services.addheight(3.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "XX154520",
                    style: styleSheet.textTheme.fs16Normal,
                  ),
                ),
              ],
            ),
            styleSheet.services.addheight(15.h),
            SvgPicture.asset(
              styleSheet.icons.paymentSuccessfull,
            ),
            styleSheet.services.addheight(15.h),
            Text(
              LanguageConst.paymentSuccessful.tr,
              style: styleSheet.textTheme.fs24Normal,
            ),
            styleSheet.services.addheight(15.h),
            Divider(
              color: styleSheet.colors.gray,
            ),
            styleSheet.services.addheight(15.h),
            RowPrefixtextSuffixtext(
              prefixtext: LanguageConst.paymentTo.tr,
              suffixtext: LanguageConst.time.tr,
              prefixTextStyle: styleSheet.textTheme.fs14Normal
                  .copyWith(color: styleSheet.colors.gray),
              suffixTextStyle: styleSheet.textTheme.fs12Normal
                  .copyWith(color: styleSheet.colors.gray),
            ),
            styleSheet.services.addheight(5.h),
            RowPrefixtextSuffixtext(
              prefixtext: "CC Rental",
              suffixtext: "10:am",
              prefixTextStyle: styleSheet.textTheme.fs16Normal,
              suffixTextStyle: styleSheet.textTheme.fs12Normal,
            ),
            styleSheet.services.addheight(15.h),
            RowPrefixtextSuffixtext(
              prefixtext: LanguageConst.amount.tr,
              suffixtext: "₹ 12,00",
              prefixTextStyle: styleSheet.textTheme.fs14Normal
                  .copyWith(color: styleSheet.colors.gray),
              suffixTextStyle: styleSheet.textTheme.fs14Bold,
            ),
            styleSheet.services.addheight(11.h),
            RowPrefixtextSuffixtext(
              prefixtext: LanguageConst.modeOfPayment.tr,
              suffixtext: "Debit Card",
              prefixTextStyle: styleSheet.textTheme.fs14Normal
                  .copyWith(color: styleSheet.colors.gray),
              suffixTextStyle: styleSheet.textTheme.fs14Normal,
            ),
            styleSheet.services.addheight(11.h),
            RowPrefixtextSuffixtext(
              prefixtext: LanguageConst.promoCodeApplied.tr,
              suffixtext: "₹ 200",
              prefixTextStyle: styleSheet.textTheme.fs14Normal
                  .copyWith(color: styleSheet.colors.gray),
              suffixTextStyle: styleSheet.textTheme.fs14Bold,
            ),
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
                    LanguageConst.paidAmount.tr,
                    style: styleSheet.textTheme.fs16Normal
                        .copyWith(color: styleSheet.colors.gray),
                  ),
                  styleSheet.services.addheight(3.h),
                  Text(
                    "₹ 1,000",
                    style: styleSheet.textTheme.fs16Bold
                        .copyWith(color: styleSheet.colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
