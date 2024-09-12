import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Buttons/second_primary_button.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Components/Tiles/rentalcar_tile.dart';
import 'package:car_booking_customer/Components/row_prefixtext_suffixtext.dart';
import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:car_booking_customer/Data/Functions/app_functions.dart';
import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Views/Car%20Perview/image_video_list_screen.dart';
import 'package:car_booking_customer/main.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CarPreviewScreen extends StatefulWidget {
  CarModel model;
  CarPreviewScreen({super.key, required this.model});

  @override
  State<CarPreviewScreen> createState() => _CarPreviewScreenState();
}

class _CarPreviewScreenState extends State<CarPreviewScreen> {
  int currentindex = 0;
  final carController = Get.find<CarController>();
  @override
  Widget build(BuildContext context) {
    CreatePackageModel bestpackageList =
        AppFunctions.findLessPrice(widget.model.package!);
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.sp).copyWith(top: 0),
        child: Row(
          children: [
            GetBuilder<WishListController>(builder: (wishListController) {
              final wishListvalue = wishListController.wishListData
                  .any((e) => e == widget.model.id);

              return SecondPrimaryButton(
                title: LanguageConst.wishList.tr,
                onPressed: () async {
                  if (wishListvalue) {
                    await wishListController.remove(widget.model.id!);
                  } else {
                    await wishListController.setWishData(widget.model.id!);
                  }
                },
                iconColor: wishListvalue
                    ? styleSheet.colors.white
                    : styleSheet.colors.black,
                icon: styleSheet.icons.black_heart,
                backGroundTransparent: wishListvalue ? false : true,
              );
            }),
            styleSheet.services.addwidth(15.w),
            Expanded(
              child: PrimaryButton(
                title: LanguageConst.rentNow.tr,
                onPressed: () {},
                // isExpanded: true,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              height: 200.h,
                              width: styleSheet.services.screenWidth(context),
                              fit: BoxFit.cover,
                              imageUrl: widget.model.image!.first,
                              placeholder: (context, url) => Center(
                                child: SizedBox(
                                    height: 50.sp,
                                    width: 50.sp,
                                    child: CircularProgressIndicator(
                                      color: styleSheet.colors.black,
                                    )),
                              ),
                              errorWidget: (context, url, error) =>
                                  Center(child: Icon(Icons.error)),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.r),
                                  decoration: BoxDecoration(
                                      color: styleSheet.colors.black,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: SvgPicture.asset(
                                    styleSheet.icons.leftArrow,
                                    color: styleSheet.colors.white,
                                  ),
                                ),
                              )),
                          Positioned(
                              right: 0,
                              top: 10,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 11.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                    color: styleSheet.colors.green,
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(5))),
                                child: Text(LanguageConst.available.tr,
                                    style: styleSheet.textTheme.fs12Normal
                                        .copyWith(
                                            color: styleSheet.colors.white)),
                              )),
                        ],
                      ),
                      styleSheet.services.addheight(15.h),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: widget.model.carmodel,
                            style: styleSheet.textTheme.fs24Normal
                                .copyWith(color: styleSheet.colors.black)),
                        TextSpan(
                            text: " ( ${widget.model.manufactureyear} )",
                            style: styleSheet.textTheme.fs16Normal
                                .copyWith(color: styleSheet.colors.black))
                      ])),
                      Row(
                        children: [
                          Text(
                            "4.0",
                            style: styleSheet.textTheme.fs16Normal
                                .copyWith(color: styleSheet.colors.gray),
                          ),
                          styleSheet.services.addwidth(6.w),
                          RatingBar.readOnly(
                            size: 15,
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            initialRating: 3,
                            maxRating: 5,
                          ),
                          styleSheet.services.addwidth(6.w),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "1.8K ",
                                style: styleSheet.textTheme.fs16Normal
                                    .copyWith(color: styleSheet.colors.black)),
                            TextSpan(
                                text: LanguageConst.review.tr,
                                style: styleSheet.textTheme.fs12Normal
                                    .copyWith(color: styleSheet.colors.black))
                          ])),
                        ],
                      ),
                      styleSheet.services.addheight(15.h),
                      Text(
                        LanguageConst.priceR.tr,
                        style: styleSheet.textTheme.fs14Normal,
                      ),
                    ],
                  ),
                ),
                styleSheet.services.addheight(15.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
                  decoration: BoxDecoration(
                      color: styleSheet.colors.primary,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(18))),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "₹ ${bestpackageList.ammount} ",
                        style: styleSheet.textTheme.fs20Medium),
                    TextSpan(
                        text: bestpackageList.packagetype,
                        style: styleSheet.textTheme.fs20Normal)
                  ])),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      styleSheet.services.addheight(15.h),
                      Text(
                        LanguageConst.introduction.tr,
                        style: styleSheet.textTheme.fs16Normal,
                      ),
                      styleSheet.services.addheight(15.h),
                      Text(
                        widget.model.description ?? "",
                        style: styleSheet.textTheme.fs14Normal
                            .copyWith(color: styleSheet.colors.gray),
                      ),
                      styleSheet.services.addheight(15.h),
                      PrimaryContainer(
                        padding: EdgeInsets.only(
                            bottom: 10.h, top: 20.h, right: 10.w, left: 10.w),
                        width: styleSheet.services.screenWidth(context),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(
                                  () => ImageVideoListScreen(
                                    model: widget.model,
                                  ),
                                );
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Transform.translate(
                                    offset: Offset(0, -12),
                                    child: Container(
                                      height: 100,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: styleSheet.colors.lightgray,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(0, -6),
                                    child: Container(
                                      height: 100,
                                      width: 95,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: styleSheet.colors.gray
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  CachedNetworkImage(
                                    imageUrl: widget.model.image!.last,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image:
                                              imageProvider, // Replace with your image URL
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(
                                      child: SizedBox(
                                          height: 18.sp,
                                          width: 18.sp,
                                          child: CircularProgressIndicator(
                                            color: styleSheet.colors.white,
                                          )),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Center(child: Icon(Icons.error)),
                                  ),
                                ],
                              ),
                            ),
                            styleSheet.services.addwidth(10.w),
                            InkWell(
                              onTap: () {
                                Get.to(
                                  () => ImageVideoListScreen(
                                    model: widget.model,
                                  ),
                                );
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Transform.translate(
                                    offset: Offset(0, -12),
                                    child: Container(
                                      height: 100,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: styleSheet.colors.lightgray,
                                      ),
                                    ),
                                  ),
                                  Transform.translate(
                                    offset: Offset(0, -6),
                                    child: Container(
                                      height: 100,
                                      width: 95,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: styleSheet.colors.gray
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      // color: Colors.black,
                                      image: DecorationImage(
                                        image: AssetImage(styleSheet.images
                                            .toyotacar), // Replace with your image URL
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      child: SvgPicture.asset(
                                          styleSheet.icons.playbtn)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      styleSheet.services.addheight(15.h),
                      PrimaryContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LanguageConst.carDetails.tr,
                              style: styleSheet.textTheme.fs14Normal,
                            ),
                            styleSheet.services.addheight(15.h),
                            Divider(
                              color: styleSheet.colors.gray,
                            ),
                            styleSheet.services.addheight(15.h),
                            RowPrefixtextSuffixtext(
                              prefixtext: LanguageConst.carMake.tr,
                              suffixtext: widget.model.companyname ?? "",
                              suffixTextStyle: styleSheet.textTheme.fs16Normal,
                            ),
                            styleSheet.services.addheight(15.h),
                            RowPrefixtextSuffixtext(
                              prefixtext: LanguageConst.transmission.tr,
                              suffixtext: widget.model.transmission ?? "",
                              suffixTextStyle: styleSheet.textTheme.fs16Normal,
                            ),
                            styleSheet.services.addheight(15.h),
                            RowPrefixtextSuffixtext(
                              prefixtext: LanguageConst.color.tr,
                              suffixtext: widget.model.carcolor ?? "",
                              suffixTextStyle: styleSheet.textTheme.fs16Normal,
                            ),
                            styleSheet.services.addheight(15.h),
                            RowPrefixtextSuffixtext(
                              prefixtext: LanguageConst.licensePlateNo.tr,
                              suffixtext: widget.model.platenumber ?? "",
                              suffixTextStyle: styleSheet.textTheme.fs16Normal,
                            ),
                            styleSheet.services.addheight(15.h),
                            RowPrefixtextSuffixtext(
                              prefixtext: LanguageConst.seatingCapacity.tr,
                              suffixtext:
                                  "${widget.model.seatingcapacity} ${LanguageConst.seats.tr}",
                              suffixTextStyle: styleSheet.textTheme.fs16Normal,
                            ),
                          ],
                        ),
                      ),
                      styleSheet.services.addheight(15.h),
                      Divider(),
                      styleSheet.services.addheight(15.h),
                      Text(
                        LanguageConst.similarVehicles.tr,
                        style: styleSheet.textTheme.fs16Normal,
                      ),
                      styleSheet.services.addheight(15.h),
                      AspectRatio(
                        aspectRatio: 1.6,
                        child: ListView.builder(
                          clipBehavior: Clip.none,
                          itemCount: carController.carData.data!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: RentalCarTile(
                                  model: widget.model,
                                  onPressed: () {
                                    Get.to(() => CarPreviewScreen(
                                        model: carController
                                            .carData.data![index]));
                                  },
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
