import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_booking_customer/Models/booking_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingsCarTile extends StatefulWidget {
  final BookingModel model;
  const BookingsCarTile({
    super.key,
    required this.model,
  });

  @override
  State<BookingsCarTile> createState() => _BookingsCarTileState();
}

class _BookingsCarTileState extends State<BookingsCarTile> {
  final GlobalKey _cardKey = GlobalKey();

  // Size _cardHeight = const Size(0, 0);

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final RenderBox renderBox =
    //       _cardKey.currentContext?.findRenderObject() as RenderBox;
    //   _cardHeight = renderBox.size;
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesName.bookingDetailsScreen,
            arguments: {"model": widget.model});
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.model.cars!.first.image!.first,
              imageBuilder: (context, imageProvider) {
                return Container(
                  key: _cardKey,
                  width: styleSheet.services.screenWidth(context),
                  height: styleSheet.services.screenHeight(context) * 0.24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: imageProvider),
                  ),
                );
              },
            ),
            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     width: _cardHeight.width,
            //     height: _cardHeight.height * 0.4,
            //     decoration: BoxDecoration(
            //         gradient: LinearGradient(
            //             begin: Alignment.topCenter,
            //             end: Alignment.bottomCenter,
            //             colors: [
            //           Colors.black.withOpacity(0),
            //           Colors.black,
            //         ])),
            //   ),
            // ),
            Container(
              padding: const EdgeInsets.only(bottom: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("₹ ${widget.model.amount}",
                              style: styleSheet.textTheme.fs24Bold
                                  .copyWith(color: styleSheet.colors.white))
                          .paddingOnly(left: 15.w),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
                      decoration: BoxDecoration(
                        color: styleSheet.colors.lightgreen,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.r),
                            bottomLeft: Radius.circular(20.r)),
                      ),
                      child: Text(
                        LanguageConst.seeD.tr,
                        style: styleSheet.textTheme.fs16Normal
                            .copyWith(color: styleSheet.colors.primary),
                      ),
                    )
                  ],
                ),
              ),
            ),
            /** BOOKING ID TAG */
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
                decoration: BoxDecoration(
                    color: styleSheet.colors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(14.r),
                        bottomLeft: Radius.circular(14.r))),
                child: Column(
                  children: [
                    Text(
                      "${widget.model.bookingID}",
                      style: styleSheet.textTheme.fs16Bold
                          .copyWith(color: styleSheet.colors.white),
                    ),
                    Text(
                      LanguageConst.bookingID.tr,
                      style: styleSheet.textTheme.fs12Normal
                          .copyWith(color: styleSheet.colors.white),
                    ),
                  ],
                ),
              ),
            ),
            // Positioned(
            //   top: 0,
            //   left: 21.w,
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            //     height: _cardHeight.height * 0.65,
            //     decoration: BoxDecoration(
            //         color: styleSheet.colors.black,
            //         borderRadius: BorderRadius.only(
            //             bottomLeft: Radius.circular(10.r),
            //             bottomRight: Radius.circular(10.r))),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         CarPartTextIcon(
            //             title: LanguageConst.petrol.tr,
            //             iconpath: styleSheet.icons.petrol),
            //         styleSheet.services.addheight(6.h),
            //         CarPartTextIcon(
            //             title: LanguageConst.auto.tr,
            //             iconpath: styleSheet.icons.gear),
            //         styleSheet.services.addheight(6.h),
            //         CarPartTextIcon(
            //             title: "4 ${LanguageConst.seats.tr}",
            //             iconpath: styleSheet.icons.seat),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
