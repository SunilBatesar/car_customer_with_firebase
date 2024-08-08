import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';

class RowPrefixtextSuffixtext extends StatelessWidget {
  final String prefixtext, suffixtext;
  final TextStyle? prefixTextStyle, suffixTextStyle;
  const RowPrefixtextSuffixtext(
      {super.key,
      required this.prefixtext,
      required this.suffixtext,
      this.prefixTextStyle,
      this.suffixTextStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            prefixtext,
            style: prefixTextStyle ??
                styleSheet.textTheme.fs16Normal
                    .copyWith(color: styleSheet.colors.gray),
          ),
        ),
        Text(
          suffixtext,
          style: suffixTextStyle ?? styleSheet.textTheme.fs16Bold,
        ),
      ],
    );
  }
}
