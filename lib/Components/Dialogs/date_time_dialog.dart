import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class DateTimeDialog extends StatefulWidget {
  const DateTimeDialog({
    super.key,
  });

  @override
  State<DateTimeDialog> createState() => _DateTimeDialogState();
}

class _DateTimeDialogState extends State<DateTimeDialog> {
  String time = DateFormat("hh:mm a").format(DateTime.now());
  String date = DateFormat("dd/MM/yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(LanguageConst.setTime.tr,
                style: styleSheet.textTheme.fs14Normal),
            styleSheet.services.addheight(15.h),
            TimePickerSpinnerPopUp(
              mode: CupertinoDatePickerMode.time,
              use24hFormat: false,
              initTime: DateTime.now(),
              timeFormat: "hh mm a",
              isCancelTextLeft: true,
              cancelText: LanguageConst.cancel.tr,
              confirmText: LanguageConst.ok.tr,
              confirmTextStyle: styleSheet.textTheme.fs16Normal
                  .copyWith(color: styleSheet.colors.black),
              cancelTextStyle: styleSheet.textTheme.fs16Normal
                  .copyWith(color: styleSheet.colors.black),
              textStyle: styleSheet.textTheme.fs28Normal,
              timeWidgetBuilder: (dateTime) {
                final hh = DateFormat("hh").format(dateTime);
                final mm = dateTime.minute.toString();
                final a = DateFormat('a').format(dateTime);
                final time = [hh, mm, a];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      time.length,
                      (index) => Text(
                        time[index],
                        style: styleSheet.textTheme.fs28Normal,
                      ),
                    ),
                  ),
                );
              },
              onChange: (dateTime) {
                time = DateFormat("hh:mm a").format(dateTime);
              },
            ),
            styleSheet.services.addheight(15.h),
            Divider(
              color: styleSheet.colors.gray,
            ),
            styleSheet.services.addheight(15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LanguageConst.setDate.tr,
                    style: styleSheet.textTheme.fs14Normal),
                SvgPicture.asset(styleSheet.icons.calender)
              ],
            ),
            TimePickerSpinnerPopUp(
              mode: CupertinoDatePickerMode.date,
              initTime: DateTime.now(),
              barrierColor: Colors.transparent,
              minuteInterval: 1,
              isCancelTextLeft: true,
              cancelText: LanguageConst.cancel.tr,
              confirmText: LanguageConst.ok.tr,
              confirmTextStyle: styleSheet.textTheme.fs16Normal
                  .copyWith(color: styleSheet.colors.black),
              cancelTextStyle: styleSheet.textTheme.fs16Normal
                  .copyWith(color: styleSheet.colors.black),
              textStyle: styleSheet.textTheme.fs28Normal,
              timeWidgetBuilder: (dateTime) {
                final dd = dateTime.day.toString();
                final mm = dateTime.month.toString();
                final yyyy = dateTime.year.toString();
                const String add = "/";
                final time = [dd, add, mm, add, yyyy];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      time.length,
                      (index) => Text(
                        time[index],
                        style: styleSheet.textTheme.fs28Normal,
                      ),
                    ),
                  ),
                );
              },
              onChange: (dateTime) {
                date = DateFormat("dd/MM/yyyy").format(dateTime);
              },
            ),
            styleSheet.services.addheight(25.h),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    title: LanguageConst.reset.tr,
                    onPressed: () {
                      setState(() {});
                    },
                    backGroundTransparent: true,
                  ),
                ),
                styleSheet.services.addwidth(15.w),
                Expanded(
                  child: PrimaryButton(
                    title: LanguageConst.save.tr,
                    onPressed: () {
                      Get.back(result: {
                        "time": time,
                        "date": date,
                      });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
