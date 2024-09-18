// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_booking_customer/Components/DropdownButtons/create_package_model_dropdown_button.dart';
import 'package:car_booking_customer/Components/Tiles/car_part_text_icon.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingDetailCard extends StatefulWidget {
  CarModel model;
  bool increaseDecreaseButton;
  BookingDetailCard(
      {super.key, required this.model, this.increaseDecreaseButton = true});

  @override
  State<BookingDetailCard> createState() => _BookingDetailCardState();
}

class _BookingDetailCardState extends State<BookingDetailCard> {
  PackageType? packageSelect;
  @override
  void initState() {
    super.initState();
    packageSelect = widget.model.package!.first.type;
  }

  final carController = Get.find<CarController>();
  final controller = Get.find<WishListController>();
  @override
  Widget build(BuildContext context) {
    final mainCardata = carController.getTargetCar(widget.model.id!);
    final d = widget.model.package!.map((e) => e.type).toList();
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
                imageUrl: widget.model.image!.first,
              ),
            ),
            styleSheet.services.addwidth(5),
            Expanded(
              child: InkWell(
                onTap: () {
                  widget.increaseDecreaseButton
                      ? Get.dialog(Dialog(
                          child: PrimaryContainer(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CreatePackageModelDropdownButton(
                                hint: "Enter",
                                title: "Select Booking Type",
                                items: d,
                                onvalue: packageSelect!,
                                onChangedvalue: (v) {
                                  setState(() {
                                    packageSelect = v;
                                    controller.selectNewPackage(
                                        widget.model.id!, v);
                                  });
                                },
                              )
                            ],
                          )),
                        ))
                      : null;
                },
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
                              widget.model.carmodel ?? "",
                              style: styleSheet.textTheme.fs20Normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              widget.model.manufactureyear ?? "",
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
                            title: widget.model.fuel ?? "",
                            iconpath: styleSheet.icons.petrol,
                            imgcolor: styleSheet.colors.black,
                            Colors: styleSheet.colors.black,
                          ),
                          styleSheet.services.addwidth(10.w),
                          CarPartTextIcon(
                            title: widget.model.transmission ?? "",
                            iconpath: styleSheet.icons.gear,
                            imgcolor: styleSheet.colors.black,
                            Colors: styleSheet.colors.black,
                          ),
                          styleSheet.services.addwidth(10.w),
                          CarPartTextIcon(
                            title:
                                "${widget.model.seatingcapacity} ${LanguageConst.seats.tr}",
                            iconpath: styleSheet.icons.seat,
                            imgcolor: styleSheet.colors.black,
                            Colors: styleSheet.colors.black,
                          ),
                        ],
                      ),
                      styleSheet.services.addheight(5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "₹${widget.model.package![0].ammount}",
                            style: styleSheet.textTheme.fs18Normal,
                          ),
                          styleSheet.services.addwidth(5),
                          Text(
                            widget.model.package![0].packagetype ?? "",
                            style: styleSheet.textTheme.fs12Normal,
                          ),
                          styleSheet.services.addwidth(5),
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
            ),
            styleSheet.services.addwidth(5),
            Container(
              height: 95.h,
              padding: EdgeInsets.only(right: 12, top: 8, bottom: 8, left: 12),
              decoration: BoxDecoration(
                color: styleSheet.colors.white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.increaseDecreaseButton
                      ? GestureDetector(
                          onTap: () {
                            // CALL INCREASE QUANTITY
                            controller.increaseQuantity(
                                widget.model.id!, mainCardata.package!.first);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: styleSheet.colors.lightgray)),
                            child: CircleAvatar(
                                maxRadius: 10.r,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.add,
                                  size: 12.sp,
                                  color: Colors.black,
                                )),
                          ),
                        )
                      : SizedBox(),
                  styleSheet.services.addheight(5.h),
                  Text(
                    widget.model.bookingquantity.toString(),
                    style: styleSheet.textTheme.fs18Medium,
                  ),
                  styleSheet.services.addheight(5.h),
                  widget.increaseDecreaseButton
                      ? GestureDetector(
                          onTap: () {
                            if (widget.model.bookingquantity! > 1) {
                              // CALL DECREASEQUANTITY FUNCTION
                              final firstPrice = mainCardata.package!
                                  .firstWhere((e) =>
                                      e.packagetype ==
                                      widget.model.package!.first.packagetype)
                                  .ammount;
                              controller.decreaseQuantity(widget.model.id!,
                                  widget.model.package!.first, firstPrice!);
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    color: styleSheet.colors.lightgray)),
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
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
