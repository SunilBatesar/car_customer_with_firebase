import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/TextFields/secondary_text_form_field.dart';
import 'package:car_booking_customer/Components/Tiles/bookingcar_tile.dart';
import 'package:car_booking_customer/Components/Tiles/rentalcar_tile.dart';
import 'package:car_booking_customer/Components/Tiles/review_tile.dart';
import 'package:car_booking_customer/Components/row_prefixtext_suffixbutton.dart';
import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Controllers/wishlist_controller.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Data/Localdata/localdata.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Views/BottomNavigationBar/bottom_navigationbar.dart';
import 'package:car_booking_customer/Views/Car%20Perview/carperview_screen.dart';
import 'package:car_booking_customer/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
  final searchController = TextEditingController();
  final carController = Get.find<CarController>();
  final userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    // print("-----Home");
    // print(carController.carData.data!.map((e) => e.discount));
    // print("-----Home");
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: styleSheet.colors.primary, // Status bar color
        systemNavigationBarColor: Colors.white, // Navigation bar color
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(40)),
                    color: styleSheet.colors.primary),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          height: 60,
                          width: 60,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            styleSheet.images.girlprofile,
                            fit: BoxFit.cover,
                          ),
                        ),
                        styleSheet.services.addwidth(14.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                userController.userdata.data!.name ?? "",
                                style: styleSheet.textTheme.fs20Medium
                                    .copyWith(color: styleSheet.colors.white),
                              ),
                              Text(
                                userController.userdata.data!.email!,
                                style: styleSheet.textTheme.fs14Normal
                                    .copyWith(color: styleSheet.colors.white),
                              )
                            ],
                          ),
                        ),
                        styleSheet.services.addwidth(14.w),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(RoutesName.notificationScreen);
                          },
                          child: Icon(
                            Icons.notifications_none,
                            color: styleSheet.colors.white,
                          ),
                        )
                      ],
                    ),
                    Transform(
                      transform: Matrix4.translationValues(0, 20, 0),
                      child: SecondaryTextFormField(
                        controller: searchController,
                        icon: styleSheet.icons.search,
                        hinttext: LanguageConst.searchFRAC.tr,
                        iconOnTap: () async {
                          await WishListController().setWishData("555555555");
                          // Get.dialog(ExitDialog());
                        },
                      ),
                    ),
                  ],
                ),
              ),
              styleSheet.services.addheight(26.w),
              Expanded(
                child: ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(overscroll: false),
                  child: ListView(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    children: [
                      /** OFFERS BANNERS STARTS HERE */
                      CarouselSlider(
                          options: CarouselOptions(
                            enlargeCenterPage: false,
                            aspectRatio: 1.9,
                            viewportFraction: 1,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentindex = index;
                              });
                            },
                          ),
                          items: Localdata.weddingDealsDataList.map(
                            (e) {
                              return Container(
                                margin: EdgeInsets.only(right: 10.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: styleSheet.colors.white),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e["title"],
                                              style: styleSheet
                                                  .textTheme.fs20Normal,
                                            ),
                                            styleSheet.services.addheight(10),
                                            Text(
                                              e["subtitle"],
                                              style: styleSheet
                                                  .textTheme.fs14Normal
                                                  .copyWith(
                                                      color: styleSheet
                                                          .colors.primary),
                                            ),
                                            styleSheet.services.addheight(10.h),
                                            Text(
                                              "Starting from",
                                              style: styleSheet
                                                  .textTheme.fs12Normal,
                                            ),
                                            RichText(
                                                text: TextSpan(
                                                    style: styleSheet
                                                        .textTheme.fs12Normal
                                                        .copyWith(
                                                            color:
                                                                Colors.black),
                                                    children: [
                                                  TextSpan(
                                                    text: e["rupess"],
                                                    style: styleSheet
                                                        .textTheme.fs16Normal
                                                        .copyWith(
                                                            color:
                                                                Colors.black),
                                                  ),
                                                  TextSpan(
                                                    text: e["discount"],
                                                  )
                                                ]))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            child: Image.asset(
                                              e["image"],
                                              height: styleSheet.services
                                                  .screenHeight(context),
                                              fit: BoxFit.cover,
                                            )))
                                  ],
                                ),
                              );
                            },
                          ).toList()),
                      styleSheet.services.addheight(11.h),
                      /** STEPS INDICATOR STARTS HERE */
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          Localdata.weddingDealsDataList.length,
                          (index) => Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: currentindex == index ? 18.w : 9.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(20.r),
                                  right: Radius.circular(20.r)),
                              color: currentindex == index
                                  ? styleSheet.colors.black
                                  : styleSheet.colors.gray,
                            ),
                          ),
                        ),
                      ),
                      styleSheet.services.addheight(11.h),
                      /** FIND MY CAR STARTS HERE */

                      RowPrefixtextSuffixbutton(
                          prefixtext: LanguageConst.topRC.tr,
                          suffixText: LanguageConst.viewA.tr,
                          onTap: () {
                            Get.toNamed(RoutesName.allCarsViewScreen);
                          }),
                      styleSheet.services.addheight(15.h),
                      /** TOP RENTAL CARS STARTS HERE */
                      carController.carData.state == DataState.COMPLETE
                          ? AspectRatio(
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
                                        id: carController
                                            .carData.data![index].id!,
                                        onPressed: () {
                                          Get.to(() => CarPreviewScreen(),
                                              arguments: {
                                                "id": carController
                                                    .carData.data![index].id!
                                              });
                                        },
                                      )),
                                ),
                              ),
                            )
                          : SizedBox(),
                      styleSheet.services.addheight(15.h),
                      /** MY BOOKINGS STARTS HERE */

                      RowPrefixtextSuffixbutton(
                          prefixtext: LanguageConst.myB.tr,
                          suffixText: LanguageConst.seeA.tr,
                          onTap: () {
                            Get.offAll(() => BottomBarScreen(
                                  currentIndex: 1,
                                ));
                          }),
                      styleSheet.services.addheight(15.h),
                      AspectRatio(
                        aspectRatio: 1.7,
                        child: ListView.builder(
                          clipBehavior: Clip.none,
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: SizedBox(
                                width:
                                    styleSheet.services.screenWidth(context) *
                                        0.8,
                                child: BookingsCarTile(
                                  onTap: () {
                                    Get.toNamed(
                                        RoutesName.bookingDetailsScreen);
                                  },
                                )),
                          ),
                        ),
                      ),
                      styleSheet.services.addheight(15.h),
                      Container(
                        width: styleSheet.services.screenWidth(context),
                        height:
                            styleSheet.services.screenHeight(context) * 0.28,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 15.h),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  styleSheet.colors.white,
                                  styleSheet.colors.white,
                                  styleSheet.colors.white,
                                  styleSheet.colors.white,
                                  styleSheet.colors.gray.withOpacity(0.8),
                                  styleSheet.colors.gray.withOpacity(0.6),
                                  styleSheet.colors.gray.withOpacity(0.4),
                                ]),
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                                image: AssetImage(
                                  styleSheet.images.multiple_cars,
                                )),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LanguageConst.findYCAP.tr,
                              style: styleSheet.textTheme.fs14Normal,
                            ),
                            PrimaryButton(
                              title: LanguageConst.findMC.tr,
                              onPressed: () {
                                Get.toNamed(RoutesName.findcarsScreen);
                              },
                              isExpanded: true,
                            )
                          ],
                        ),
                      ),
                      styleSheet.services.addheight(15.h),
                      /** ALL REVIEWS STARTS HERE */

                      RowPrefixtextSuffixbutton(
                          prefixtext: LanguageConst.reviews.tr,
                          suffixText: LanguageConst.seeA.tr,
                          onTap: () {
                            Get.toNamed(RoutesName.allReviewsScreen);
                          }),
                      styleSheet.services.addheight(15.h),
                      AspectRatio(
                        aspectRatio: 2.7,
                        child: ListView.builder(
                          clipBehavior: Clip.none,
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(right: 15.w),
                            child: const ReviewTile(),
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
      ),
    );
  }
}
