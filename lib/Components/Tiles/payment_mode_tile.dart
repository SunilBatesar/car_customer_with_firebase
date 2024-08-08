import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';

class PaymentModeTile extends StatelessWidget {
  final String title;
  final bool? boolvalue;
  final Function(bool) onChanged;
  const PaymentModeTile(
      {super.key,
      required this.title,
      this.boolvalue = false,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!boolvalue!);
      },
      child: PrimaryContainer(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: styleSheet.textTheme.fs16Normal,
          ),
          Checkbox(
            value: boolvalue,
            onChanged: (value) {
              onChanged(value!);
            },
            checkColor: styleSheet.colors.white,
            activeColor: styleSheet.colors.black,
          )
        ],
      )),
    );
  }
}
