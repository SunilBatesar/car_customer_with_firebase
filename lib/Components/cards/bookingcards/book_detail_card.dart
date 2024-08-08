// ignore_for_file: must_be_immutable

import 'package:car_booking_customer/Components/Tiles/car_part_text_icon.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingDetailCard extends StatefulWidget {
  String image;
  String carname, year, rate, offer;
  BookingDetailCard(
      {super.key,
      required this.image,
      required this.carname,
      required this.year,
      required this.rate,
      required this.offer});

  @override
  State<BookingDetailCard> createState() => _BookingDetailCardState();
}

class _BookingDetailCardState extends State<BookingDetailCard> {
  int _counter = 1;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              width: 80,
              decoration: BoxDecoration(
                color: styleSheet.colors.white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              padding: EdgeInsets.only(
                  left: 5.sp, right: 5.sp, top: 37.sp, bottom: 37.sp),
              child: Image.asset(
                widget.image,
              ),
            ),
            styleSheet.services.addwidth(5),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                decoration: BoxDecoration(
                  color: styleSheet.colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Text(
                            widget.carname,
                            style: styleSheet.textTheme.fs20Normal,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.year,
                            style: styleSheet.textTheme.fs16Normal,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    styleSheet.services.addheight(5),
                    Row(
                      children: [
                        CarPartTextIcon(
                          title: LanguageConst.petrol.tr,
                          iconpath: styleSheet.icons.petrol,
                          imgcolor: styleSheet.colors.black,
                          Colors: styleSheet.colors.black,
                        ),
                        styleSheet.services.addwidth(10.w),
                        CarPartTextIcon(
                          title: LanguageConst.automatic.tr,
                          iconpath: styleSheet.icons.gear,
                          imgcolor: styleSheet.colors.black,
                          Colors: styleSheet.colors.black,
                        ),
                        styleSheet.services.addwidth(10.w),
                        CarPartTextIcon(
                          title: "2 ${LanguageConst.seats.tr}",
                          iconpath: styleSheet.icons.seat,
                          imgcolor: styleSheet.colors.black,
                          Colors: styleSheet.colors.black,
                        ),
                      ],
                    ),
                    styleSheet.services.addheight(5),
                    Row(
                      children: [
                        Text(
                          widget.rate,
                          style: styleSheet.textTheme.fs18Normal,
                        ),
                        Text(
                          LanguageConst.day.tr,
                          style: styleSheet.textTheme.fs12Normal,
                        ),
                        Text(
                          widget.offer,
                          style: styleSheet.textTheme.fs12Normal,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            styleSheet.services.addwidth(5),
            Container(
              padding: EdgeInsets.only(right: 12, top: 8, bottom: 8, left: 12),
              decoration: BoxDecoration(
                color: styleSheet.colors.white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _incrementCounter();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: styleSheet.colors.lightgray)),
                      child: CircleAvatar(
                          maxRadius: 10.r,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add,
                            size: 12.sp,
                            color: Colors.black,
                          )),
                    ),
                  ),
                  styleSheet.services.addheight(5.h),
                  Text(
                    _counter.toString(),
                    style: styleSheet.textTheme.fs18Medium,
                  ),
                  styleSheet.services.addheight(5.h),
                  GestureDetector(
                    onTap: () {
                      _decrementCounter();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: styleSheet.colors.lightgray)),
                      child: CircleAvatar(
                        maxRadius: 10.r,
                        backgroundColor: Colors.white,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Icon(
                            Icons.minimize_rounded,
                            size: 12.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
