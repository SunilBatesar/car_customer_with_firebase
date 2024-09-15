import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddressTile extends StatelessWidget {
  String address;
  String destination;
  final Function? onPressedEdit;
  AddressTile(
      {super.key,
      required this.address,
      required this.destination,
      this.onPressedEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: styleSheet.services.screenWidth(context),
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          color: styleSheet.colors.white,
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(LanguageConst.address.tr,
                  style: styleSheet.textTheme.fs14Normal),
              onPressedEdit != null
                  ? GestureDetector(
                      onTap: () {
                        onPressedEdit!();
                      },
                      child: SvgPicture.asset(
                        styleSheet.icons.editIcon,
                        height: 24.sp,
                        width: 24.sp,
                      ),
                    )
                  : SizedBox()
            ],
          ),
          styleSheet.services.addheight(10.h),
          Text(address, style: styleSheet.textTheme.fs16Normal),
          styleSheet.services.addheight(15.h),
          Text(LanguageConst.destination.tr,
              style: styleSheet.textTheme.fs14Normal),
          styleSheet.services.addheight(10.h),
          Text(destination, style: styleSheet.textTheme.fs16Normal),
        ],
      ),
    );
  }
}
