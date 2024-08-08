import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:car_booking_customer/main.dart';

class LocationPermissionDialog extends StatelessWidget {
  const LocationPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
            color: styleSheet.colors.white,
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text.rich(   
                    TextSpan(
                        text: "Allow ",
                        style: styleSheet.textTheme.fs14Normal
                            .copyWith(color: styleSheet.colors.gray),
                        children: <TextSpan>[
                          TextSpan(
                              text: "CC Rental",
                              style: styleSheet.textTheme.fs16Normal
                                  .copyWith(color: styleSheet.colors.black)),
                          const TextSpan(
                            text: "to Access this Device Location",
                          ),
                        ]),
                  ),
                  const Divider(),
                  Container(
                    padding: EdgeInsets.all(10.sp),
                    decoration: BoxDecoration(
                        border: Border.all(color: styleSheet.colors.gray),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Row(
                      children: [
                        SvgPicture.asset(styleSheet.icons.vector),
                        styleSheet.services.addwidth(10.w),
                        Expanded(
                          child: Text(
                            "This App state that it may share location data with third parties app",
                            style: styleSheet.textTheme.fs12Normal,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 24.sp,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(styleSheet.images.mapImage),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Precise",
                        style: styleSheet.textTheme.fs12Normal,
                      ),
                      Text(
                        "Approximate",
                        style: styleSheet.textTheme.fs12Normal,
                      )
                    ],
                  ),
                  styleSheet.services.addheight(15.h),
                  PrimaryButton(
                    title: "While Using the app",
                    onPressed: () {},
                    isExpanded: true,
                  ),
                  styleSheet.services.addheight(15.h),
                  PrimaryButton(
                    title: "Only this time",
                    onPressed: () {},
                    isExpanded: true,
                  ),
                  styleSheet.services.addheight(15.h),
                  PrimaryButton(
                    title: "Don’t Allow",
                    onPressed: () {},
                    isExpanded: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
