import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Utils/app_validators.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SecondaryTextFormField extends StatelessWidget {
  final String? title;
  final String? hinttext;
  final String icon;
  final String? icon2;
  final Color? iconColor;
  final Color? icon2Color;
  final Function iconOnTap;
  final Function? icon2OnTap;
  final TextEditingController controller;
  final TextInputType? keyboardtype;
  final Function(String)? fieldSubmitted;
  final AppValidator? validator;
  const SecondaryTextFormField(
      {super.key,
      required this.controller,
      required this.icon,
      this.icon2,
      required this.iconOnTap,
      this.icon2OnTap,
      this.title,
      this.hinttext,
      this.fieldSubmitted,
      this.keyboardtype,
      this.validator,
      this.iconColor,
      this.icon2Color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title!,
                style: styleSheet.textTheme.fs16Normal,
              )
            : const SizedBox(),
        title != null ? styleSheet.services.addheight(10.h) : SizedBox(),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                onFieldSubmitted: fieldSubmitted != null
                    ? (value) => fieldSubmitted!(value)
                    : null,
                keyboardType: keyboardtype,
                validator:
                    validator == null ? null : (v) => validator!.validator(v),
                decoration: InputDecoration(
                  constraints:
                      BoxConstraints(maxHeight: 50.sp, minHeight: 40.sp),
                  // isDense: true,
                  errorStyle: styleSheet.textTheme.fs14Normal
                      .copyWith(color: styleSheet.colors.red70),
                  filled: true,
                  fillColor: styleSheet.colors.white,
                  hintText: hinttext,
                  hintStyle: styleSheet.textTheme.fs16Normal
                      .copyWith(color: styleSheet.colors.lightgray),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            styleSheet.services.addwidth(10.w),
            GestureDetector(
              onTap: () {
                iconOnTap();
              },
              child: PrimaryContainer(
                padding: EdgeInsets.all(15.sp),
                height: 51.sp,
                width: 51.sp,
                child: SizedBox(
                  width: 18.sp,
                  height: 18.sp,
                  child: SvgPicture.asset(
                    icon,
                    color: iconColor ?? styleSheet.colors.gray,
                  ),
                ),
              ),
            ),
            icon2 != null
                ? GestureDetector(
                    onTap: () {
                      icon2OnTap != null ? icon2OnTap!() : null;
                    },
                    child: PrimaryContainer(
                      margin: EdgeInsets.only(left: 10.w),
                      padding: EdgeInsets.all(15.sp),
                      height: 51.sp,
                      width: 51.sp,
                      child: SizedBox(
                        width: 18.sp,
                        height: 18.sp,
                        child: SvgPicture.asset(
                          icon2!,
                          color: icon2Color ?? styleSheet.colors.gray,
                        ),
                      ),
                    ),
                  ) 
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
