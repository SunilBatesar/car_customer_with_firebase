import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Components/cards/bookingcards/book_detail_card.dart';
import 'package:car_booking_customer/Components/row_prefixtext_suffixtext.dart';
import 'package:car_booking_customer/Controllers/booking_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarWidget extends StatelessWidget {
  CarWidget({super.key});
  final bookingController = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListController>(builder: (controller) {
      //  GET WISH LIST DATA IN CAR CONTROLLER
      List<CarModel> cardata = controller.wishListCarData;
      bookingController.totalprice = controller.totalPrice(
          cardata); // BOOKING ADD ALL CARS PRICE AND STORE BOOKING CONTROLLER TOTALPRICE
      return Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: ScrollBehavior().copyWith(scrollbars: false),
              child: ListView(
                children: [
                  ListView.builder(
                      itemCount: cardata.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BookingDetailCard(
                          model: controller.findCar(cardata[index].id!),
                        ).paddingOnly(bottom: 10.h);
                      }),
                ],
              ),
            ),
          ),
          PrimaryContainer(
              child: Column(
            children: [
              ListView.builder(
                  itemCount: cardata.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RowPrefixtextSuffixtext(
                        prefixtext:
                            "${cardata[index].carmodel!}  (${cardata[index].manufactureyear!})",
                        suffixtext:
                            "₹ ${cardata[index].package!.first.ammount!}");
                  }),
              styleSheet.services.addheight(11.h),
              Divider(
                color: styleSheet.colors.gray,
              ),
              styleSheet.services.addheight(11.h),
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
                      "₹ ${bookingController.totalprice}",
                      style: styleSheet.textTheme.fs16Bold,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      );
    });
  }
}
