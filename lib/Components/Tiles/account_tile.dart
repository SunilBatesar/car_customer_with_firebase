import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountTile extends StatelessWidget {
  final String txt, img;
  final Function onpressed;

  const AccountTile(
      {super.key,
      required this.txt,
      required this.img,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onpressed();
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: SvgPicture.asset(img),
      title: Text(
        txt,
        style: styleSheet.textTheme.fs16Normal,
      ),
    );
  }
}
