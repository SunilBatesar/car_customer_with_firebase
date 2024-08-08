import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HelpSupportTile extends StatelessWidget {
  String title, prefixicon;
  Function onPressed;

  HelpSupportTile({
    super.key,
    required this.onPressed,
    required this.prefixicon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: PrimaryContainer(
          padding: EdgeInsets.all(15.sp),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(prefixicon),
              styleSheet.services.addwidth(15.w),
              Text(
                title,
                style: styleSheet.textTheme.fs16Normal,
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(styleSheet.icons.rightArrow2),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
