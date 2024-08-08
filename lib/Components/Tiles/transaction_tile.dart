import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Transactiontile extends StatelessWidget {
  final Function onTap;
  const Transactiontile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: PrimaryContainer(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: styleSheet.colors.bgclr, shape: BoxShape.circle),
            height: 50.sp,
            width: 50.sp,
            child: Image.asset(styleSheet.images.girlprofile),
          ),
          styleSheet.services.addwidth(10.w),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mr Jagdesh",
                style: styleSheet.textTheme.fs16Normal,
              ),
              styleSheet.services.addheight(5.h),
              Text(
                "Lorem ipsum dolor sit amet consectetur.",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: styleSheet.textTheme.fs14Normal
                    .copyWith(color: styleSheet.colors.gray),
              ),
            ],
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "12/05/03",
                style: styleSheet.textTheme.fs12Normal
                    .copyWith(color: styleSheet.colors.primary),
              ),
              styleSheet.services.addheight(5.h),
              Text(
                "+ ₹12,00",
                style: styleSheet.textTheme.fs18Medium
                    .copyWith(color: styleSheet.colors.green),
              ),
            ],
          )
        ],
      )),
    );
  }
}
