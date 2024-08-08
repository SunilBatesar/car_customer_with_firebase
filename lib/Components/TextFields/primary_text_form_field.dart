import 'package:car_booking_customer/Utils/app_validators.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryTextFormField extends StatelessWidget {
  final String? title;
  final String? hinttext;
  final String? suffixicon;
  final Color? titleColor;
  final Color? hinttextColor;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardtype;
  final Function(String)? fieldSubmitted;
  final AppValidator? validator;
  final bool obscureText;
  final bool isDense;
  final bool readOnly;
  final Function? onTap;
  final Function? suffixiconOnTap;
  const PrimaryTextFormField({
    super.key,
    this.title,
    this.titleColor,
    this.hinttext,
    this.hinttextColor,
    this.controller,
    this.focusNode,
    this.fieldSubmitted,
    this.keyboardtype,
    this.validator,
    this.suffixicon,
    this.obscureText = false,
    this.isDense = true,
    this.readOnly = false,
    this.onTap,
    this.suffixiconOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title!,
                style: styleSheet.textTheme.fs16Normal
                    .copyWith(color: titleColor ?? styleSheet.colors.white),
              )
            : const SizedBox(),
        title != null ? styleSheet.services.addheight(10.h) : const SizedBox(),
        TextFormField(
          onTap: () {
            onTap != null ? onTap!() : null;
          },
          controller: controller,
          focusNode: focusNode,
          onFieldSubmitted:
              fieldSubmitted != null ? (value) => fieldSubmitted!(value) : null,
          keyboardType: keyboardtype,
          validator: validator == null ? null : (v) => validator!.validator(v),
          style: styleSheet.textTheme.fs16Normal,
          obscureText: obscureText,
          readOnly: readOnly,
          decoration: InputDecoration(
            errorStyle: styleSheet.textTheme.fs14Normal
                .copyWith(color: styleSheet.colors.red70),
            isDense: isDense,
            filled: true,
            fillColor: styleSheet.colors.white,
            hintText: hinttext,
            hintStyle: styleSheet.textTheme.fs16Normal
                .copyWith(color: hinttextColor ?? styleSheet.colors.gray),
            suffixIcon: suffixicon != null
                ? GestureDetector(
                    onTap: () {
                      suffixiconOnTap != null ? suffixiconOnTap!() : null;
                    },
                    child: SizedBox(
                      height: 20.sp,
                      width: 20.sp,
                      child: Center(
                        child: SvgPicture.asset(
                          suffixicon!,
                          color: styleSheet.colors.gray,
                        ),
                      ),
                    ),
                  )
                : null,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
