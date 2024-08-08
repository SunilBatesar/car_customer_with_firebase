import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';

class RowPrefixtextSuffixbutton extends StatelessWidget {
  final String prefixtext;
  final String suffixText;
  final Function onTap;
  const RowPrefixtextSuffixbutton(
      {super.key,
      required this.prefixtext,
      required this.suffixText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(prefixtext, style: styleSheet.textTheme.fs16Normal),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(suffixText, style: styleSheet.textTheme.fs14Normal),
        )
      ],
    );
  }
}
