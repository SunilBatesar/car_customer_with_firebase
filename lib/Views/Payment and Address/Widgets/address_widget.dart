import 'package:car_booking_customer/Components/TextFields/secondary_text_form_field.dart';
import 'package:car_booking_customer/Components/row_prefixtext_suffixtext.dart';
import 'package:car_booking_customer/Controllers/booking_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({super.key});

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  bool containerShow = false;
  final wishlistController = Get.find<WishListController>();
  final bookingController = Get.find<BookingController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollBehavior().copyWith(scrollbars: false),
            child: ListView(
              children: [
                SecondaryTextFormField(
                  title: LanguageConst.addressDefault.tr,
                  hinttext: LanguageConst.address.tr,
                  controller: bookingController.addresscontroller,
                  icon: styleSheet.icons.location2,
                  iconOnTap: () {},
                ),
                styleSheet.services.addheight(15.h),
                SecondaryTextFormField(
                  title: LanguageConst.destination.tr,
                  hinttext: LanguageConst.choseyourDestination.tr,
                  controller: bookingController.destinationcontroller,
                  icon: styleSheet.icons.location2,
                  iconOnTap: () {},
                ),
                styleSheet.services.addheight(15.h),
                Text(
                  LanguageConst.totalKilometers.tr,
                  style: styleSheet.textTheme.fs16Normal,
                ),
                styleSheet.services.addheight(10.h),
                Text.rich(TextSpan(
                    text: "23 ${LanguageConst.kilometers.tr} ",
                    style: styleSheet.textTheme.fs18Medium,
                    children: <TextSpan>[
                      TextSpan(
                        text: "( ${LanguageConst.perKm.tr} ₹ 1,200 )",
                        style: styleSheet.textTheme.fs14Normal
                            .copyWith(color: styleSheet.colors.gray),
                      )
                    ])),
              ],
            ),
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
                      ListView.builder(
                          itemCount: wishlistController.wishListCarData.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final cardata = wishlistController.wishListCarData;
                            return RowPrefixtextSuffixtext(
                                prefixtext:
                                    "${cardata[index].carmodel!}  (${cardata[index].manufactureyear!})",
                                suffixtext:
                                    "₹ ${cardata[index].package!.first.ammount!}");
                          }),
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
                      "₹ ${bookingController.totalprice}",
                      style: styleSheet.textTheme.fs16Bold,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
