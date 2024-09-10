import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Components/cards/bookingcards/book_detail_card.dart';
import 'package:car_booking_customer/Components/row_prefixtext_suffixtext.dart';
import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CarWidget extends StatelessWidget {
  const CarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final carController = Get.find<CarController>();

    final wishlistController = Get.find<WishListController>();
    //  GET WISH LIST DATA IN CAR CONTROLLER
    List<CarModel> cardata = wishlistController.wishListCarData;
    return Column(
      children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(scrollbars: false),
            child: ListView(
              children: [
                ListView.builder(
                    itemCount: cardata.length,
                    // scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BookingDetailCard(
                        id: cardata[index].id!,
                      ).paddingOnly(bottom: 10.h);
                    }),
              ],
            ),
          ),
        ),
        PrimaryContainer(
            child: Column(
          children: [
            const RowPrefixtextSuffixtext(
                prefixtext: "Lamborghini Aventador Z Class ( 2023 )",
                suffixtext: "₹ 1,200"),
            styleSheet.services.addheight(11.h),
            const RowPrefixtextSuffixtext(
                prefixtext: "Mercedes Benz ( 2023 )", suffixtext: "₹ 1,200"),
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
                    "₹ 2,400",
                    style: styleSheet.textTheme.fs16Bold,
                  ),
                ],
              ),
            ),
          ],
        )),
      ],
    );
  }
}
