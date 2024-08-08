import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardSuccessfullyDialog extends StatelessWidget {
  final String image, title, sbtitle;
  const CardSuccessfullyDialog({
    super.key,
    required this.image,
    required this.title,
    required this.sbtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: PrimaryContainer(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            image,
            fit: BoxFit.cover,
          ),
          styleSheet.services.addheight(10.h),
          Text(
            title,
            style: styleSheet.textTheme.fs18Medium,
            textAlign: TextAlign.center,
          ),
          styleSheet.services.addheight(10.h),
          Text(
            sbtitle,
            style: styleSheet.textTheme.fs14Normal
                .copyWith(color: styleSheet.colors.gray),
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
