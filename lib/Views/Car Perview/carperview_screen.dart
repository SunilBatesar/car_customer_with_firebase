import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Buttons/second_primary_button.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Components/Tiles/rentalcar_tile.dart';
import 'package:car_booking_customer/Components/row_prefixtext_suffixtext.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Views/Car%20Perview/image_video_list_screen.dart';
import 'package:car_booking_customer/main.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CarPreviewScreen extends StatefulWidget {
  const CarPreviewScreen({super.key});

  @override
  State<CarPreviewScreen> createState() => _CarPreviewScreenState();
}

class _CarPreviewScreenState extends State<CarPreviewScreen> {
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.sp).copyWith(top: 0),
        child: Row(
          children: [
            SecondPrimaryButton(
              title: LanguageConst.wishList.tr,
              onPressed: () {},
              icon: styleSheet.icons.black_heart,
              backGroundTransparent: true,
            ),
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
                              child: Image.asset(
                                styleSheet.images.toyotacar,
                                width: styleSheet.services.screenWidth(context),
                                height: 200.h,
                                fit: BoxFit.cover,
                              )),
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
                            text: "Toyota Innova",
                            style: styleSheet.textTheme.fs24Normal
                                .copyWith(color: styleSheet.colors.black)),
                        TextSpan(
                            text: " ( 2023 )",
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
                        text: "₹ 1,200 ",
                        style: styleSheet.textTheme.fs20Medium),
                    TextSpan(
                        text: LanguageConst.day.tr,
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
                        "Lorem ipsum dolor sit amet consectetur. Tempus egestas consequat sed ut consectetur id magna commodo. Ac eget mauris dui pretium. Sed mauris nulla curabitur facilisis tristique enim fringilla ipsum. Nibh et laoreet egestas tortor sodales. Fringilla enim egestas sapien nisl.",
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
                                Get.to(ImageVideoListScreen());
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
                                ],
                              ),
                            ),
                            styleSheet.services.addwidth(10.w),
                            InkWell(
                              onTap: () {
                                Get.to(ImageVideoListScreen());
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
                              suffixtext: "Mercedes",
                              suffixTextStyle: styleSheet.textTheme.fs16Normal,
                            ),
                            styleSheet.services.addheight(15.h),
                            RowPrefixtextSuffixtext(
                              prefixtext: LanguageConst.transmission.tr,
                              suffixtext: "Automatic",
                              suffixTextStyle: styleSheet.textTheme.fs16Normal,
                            ),
                            styleSheet.services.addheight(15.h),
                            RowPrefixtextSuffixtext(
                              prefixtext: LanguageConst.color.tr,
                              suffixtext: "Orange",
                              suffixTextStyle: styleSheet.textTheme.fs16Normal,
                            ),
                            styleSheet.services.addheight(15.h),
                            RowPrefixtextSuffixtext(
                              prefixtext: LanguageConst.licensePlateNo.tr,
                              suffixtext: "HR4204 45AC",
                              suffixTextStyle: styleSheet.textTheme.fs16Normal,
                            ),
                            styleSheet.services.addheight(15.h),
                            RowPrefixtextSuffixtext(
                              prefixtext: LanguageConst.seatingCapacity.tr,
                              suffixtext: "4 ${LanguageConst.seats.tr}",
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
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: RentalCarTile(
                                  onPressed: () {
                                    Get.toNamed(RoutesName.carPreviewScreen);
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
