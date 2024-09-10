// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_booking_customer/Components/Tiles/car_part_text_icon.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingDetailCard extends StatefulWidget {
  String id;
  BookingDetailCard({super.key, required this.id});

  @override
  State<BookingDetailCard> createState() => _BookingDetailCardState();
}

class _BookingDetailCardState extends State<BookingDetailCard> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListController>(builder: (controller) {
      final cardata = controller.wishListCarData
          .firstWhere((e) => e.id == widget.id, orElse: () => CarModel());
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 95.h,
                decoration: BoxDecoration(
                  color: styleSheet.colors.white,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: cardata.image!.first,
                ),
              ),
              styleSheet.services.addwidth(5),
              Expanded(
                child: Container(
                  height: 95.h,
                  padding:
                      EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 10),
                  decoration: BoxDecoration(
                    color: styleSheet.colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text(
                              cardata.carmodel ?? "",
                              style: styleSheet.textTheme.fs20Normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              cardata.manufactureyear ?? "",
                              style: styleSheet.textTheme.fs16Normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ).paddingOnly(left: 5.w),
                        ],
                      ),
                      styleSheet.services.addheight(5),
                      Row(
                        children: [
                          CarPartTextIcon(
                            title: cardata.fuel ?? "",
                            iconpath: styleSheet.icons.petrol,
                            imgcolor: styleSheet.colors.black,
                            Colors: styleSheet.colors.black,
                          ),
                          styleSheet.services.addwidth(10.w),
                          CarPartTextIcon(
                            title: cardata.transmission ?? "",
                            iconpath: styleSheet.icons.gear,
                            imgcolor: styleSheet.colors.black,
                            Colors: styleSheet.colors.black,
                          ),
                          styleSheet.services.addwidth(10.w),
                          CarPartTextIcon(
                            title:
                                "${cardata.seatingcapacity} ${LanguageConst.seats.tr}",
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
                            "0.0",
                            style: styleSheet.textTheme.fs18Normal,
                          ),
                          Text(
                            LanguageConst.day.tr,
                            style: styleSheet.textTheme.fs12Normal,
                          ),
                          Text(
                            "0.0",
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
                height: 95.h,
                padding:
                    EdgeInsets.only(right: 12, top: 8, bottom: 8, left: 12),
                decoration: BoxDecoration(
                  color: styleSheet.colors.white,
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.upDateCar(cardata.copyWith(
                            bookingquantity: cardata.bookingquantity! + 1));
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
                      cardata.bookingquantity.toString(),
                      style: styleSheet.textTheme.fs18Medium,
                    ),
                    styleSheet.services.addheight(5.h),
                    GestureDetector(
                      onTap: () {
                        if (cardata.bookingquantity! > 1) {
                          controller.upDateCar(cardata.copyWith(
                              bookingquantity: cardata.bookingquantity! - 1));
                        }
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
    });
  }
}
