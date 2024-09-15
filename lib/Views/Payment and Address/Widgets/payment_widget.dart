import 'package:car_booking_customer/Components/Dialogs/date_time_dialog.dart';
import 'package:car_booking_customer/Components/Tiles/address_tile.dart';
import 'package:car_booking_customer/Components/Tiles/payment_mode_tile.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Components/cards/bookingcards/book_detail_card.dart';
import 'package:car_booking_customer/Components/row_prefixtext_suffixtext.dart';
import 'package:car_booking_customer/Controllers/booking_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:car_booking_customer/Data/Localdata/localdata.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  int? offerindex;

  bool containerShow = false;
  final wishListController = Get.find<WishListController>();
  final bookingController = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(scrollbars: false),
            child: ListView(children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: wishListController.wishListCarData.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => BookingDetailCard(
                  model: wishListController.wishListCarData[index],
                ).paddingOnly(bottom: 10.h),
              ),
              styleSheet.services.addheight(15.h),
              AddressTile(
                address: bookingController.addresscontroller.text,
                destination: bookingController.destinationcontroller.text,
                onPressedEdit: () {},
              ),
              styleSheet.services.addheight(15.h),
              bookingController.bookingtime == null &&
                      bookingController.bookingdate == null
                  ? GestureDetector(
                      onTap: () async {
                        await Get.dialog(DateTimeDialog()).then((val) {
                          if (val != null) {
                            setState(() {
                              bookingController.bookingtime = val["time"];
                              bookingController.bookingdate = val["date"];
                            });
                          }
                        });
                      },
                      child: PrimaryContainer(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LanguageConst.setTimeAndDate.tr,
                            style: styleSheet.textTheme.fs16Normal,
                          ),
                          SvgPicture.asset(styleSheet.icons.rightArrow2)
                        ],
                      )),
                    )
                  : SizedBox(),
              styleSheet.services.addheight(15.h),
              bookingController.bookingtime != null &&
                      bookingController.bookingdate != null
                  ? GestureDetector(
                      onTap: () async {
                        await Get.dialog(DateTimeDialog()).then((val) {
                          if (val != null) {
                            setState(() {
                              bookingController.bookingtime = val["time"];
                              bookingController.bookingdate = val["date"];
                            });
                          }
                        });
                      },
                      child: PrimaryContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LanguageConst.changeTimeDate.tr,
                              style: styleSheet.textTheme.fs16Normal,
                            ),
                            styleSheet.services.addheight(15.h),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LanguageConst.time.tr,
                                      style: styleSheet.textTheme.fs14Normal
                                          .copyWith(
                                              color: styleSheet.colors.gray),
                                    ),
                                    styleSheet.services.addheight(5.h),
                                    Text(
                                      DateFormat("hh:mm a").format(
                                          bookingController.bookingtime!),
                                      style: styleSheet.textTheme.fs16Normal,
                                    ),
                                  ],
                                ),
                                styleSheet.services.addwidth(20.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    styleSheet.services.addwidth(20.w),
                                    Text(
                                      LanguageConst.date.tr,
                                      style: styleSheet.textTheme.fs14Normal
                                          .copyWith(
                                              color: styleSheet.colors.gray),
                                    ),
                                    styleSheet.services.addheight(5.h),
                                    Text(
                                      DateFormat("dd/MM/yyyy").format(
                                          bookingController.bookingdate!),
                                      style: styleSheet.textTheme.fs16Normal,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ))
                  : SizedBox(),
              styleSheet.services.addheight(15.h),
              Row(
                children: [
                  Expanded(
                    child: PaymentModeTile(
                      title: LanguageConst.cash.tr,
                      boolvalue: bookingController.packagetype == "Cash",
                      onChanged: (v) {
                        setState(() {
                          bookingController.packagetype = "Cash";
                        });
                      },
                    ),
                  ),
                  styleSheet.services.addwidth(15.h),
                  Expanded(
                    child: PaymentModeTile(
                      title: LanguageConst.online.tr,
                      boolvalue: bookingController.packagetype == "Online",
                      onChanged: (v) {
                        setState(() {
                          bookingController.packagetype = "Online";
                        });
                      },
                    ),
                  ),
                ],
              ),
              styleSheet.services.addheight(15.h),
              PrimaryContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LanguageConst.saveMoreOnBooking.tr,
                      style: styleSheet.textTheme.fs14Normal,
                    ),
                    styleSheet.services.addheight(10.h),
                    Column(
                      children: List.generate(
                        Localdata.offerList.length,
                        (index) => Flex(
                          direction: Axis.horizontal,
                          children: [
                            Flexible(
                              flex: 5,
                              child: Text.rich(TextSpan(
                                  text: Localdata.offerList[index]["title"],
                                  style: styleSheet.textTheme.fs14Normal,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: Localdata.offerList[index]
                                            ["subtitle"],
                                        style: TextStyle(
                                            color: styleSheet.colors.green))
                                  ])),
                            ),
                            Flexible(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Stack(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            if (offerindex == null) {
                                              offerindex = index;
                                            } else {
                                              offerindex = null;
                                              offerindex = index;
                                            }
                                          });
                                        },
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                offerindex == index &&
                                                        offerindex != null
                                                    ? Colors.transparent
                                                    : styleSheet.colors.bgclr,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.r))),
                                        child: Text(
                                          offerindex == index &&
                                                  offerindex != null
                                              ? LanguageConst.applied.tr
                                              : LanguageConst.apply.tr,
                                          style: styleSheet.textTheme.fs16Normal
                                              .copyWith(
                                                  color: offerindex == index
                                                      ? styleSheet.colors.green
                                                      : styleSheet
                                                          .colors.black),
                                        )),
                                    offerindex == index && offerindex != null
                                        ? Positioned(
                                            right: -10,
                                            top: -15,
                                            child: IconButton(
                                                onPressed: () {
                                                  offerindex = null;
                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 20.sp,
                                                  color: styleSheet.colors.gray,
                                                )),
                                          )
                                        : SizedBox()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        AnimatedContainer(
            duration: Duration(milliseconds: 600),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (containerShow) {
                          containerShow = false;
                        } else {
                          containerShow = true;
                        }
                      });
                    },
                    icon: Icon(
                      containerShow
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 24.sp,
                      color: styleSheet.colors.gray,
                    )),
                AnimatedContainer(
                  height: containerShow ? 0 : 80.h,
                  duration: Duration(milliseconds: 600),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const RowPrefixtextSuffixtext(
                            prefixtext:
                                "Lamborghini Aventador Z Class ( 2023 )",
                            suffixtext: "₹ 1,200"),
                        styleSheet.services.addheight(11.h),
                        const RowPrefixtextSuffixtext(
                            prefixtext: "Mercedes Benz ( 2023 )",
                            suffixtext: "₹ 1,200"),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: styleSheet.colors.gray,
                ),
                styleSheet.services.addheight(5.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        LanguageConst.totalAmount.tr,
                        style: styleSheet.textTheme.fs16Normal
                            .copyWith(color: styleSheet.colors.gray),
                      ),
                      styleSheet.services.addheight(3.h),
                      Text(
                        "₹ 2,400",
                        style: styleSheet.textTheme.fs16Bold,
                      ),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
