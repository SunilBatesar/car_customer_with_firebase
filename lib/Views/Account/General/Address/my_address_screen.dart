import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Controllers/address_controller.dart';
import 'package:car_booking_customer/Controllers/google_map_controller.dart';
import 'package:car_booking_customer/Models/address_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyAddressScreen extends StatefulWidget {
  const MyAddressScreen({super.key});

  @override
  State<MyAddressScreen> createState() => _MyAddressScreenState();
}

class _MyAddressScreenState extends State<MyAddressScreen> {
  @override
  void initState() {
    super.initState();
    location(); // FUNCTION
  }

  location() async {
    final controller =
        Get.find<GoogleMapGetXController>(); // GOOGLEMAPGETXCONTROLLER
    await controller.getUserCurrentLocation(); // GET USER CURRENT LOCATION
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(builder: (controller) {
      List<AddressModel> addressdata = controller.addressData;
      return Scaffold(
        appBar: CustomAppbar(
          title: Text(LanguageConst.myAddress.tr),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryContainer(
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.addNewAddressScreen);
                          },
                          horizontalTitleGap: 0,
                          minTileHeight: 15.h,
                          contentPadding: EdgeInsets.zero,
                          iconColor: styleSheet.colors.black,
                          leading: Icon(Icons.my_location_sharp),
                          title: Text(
                            LanguageConst.addAddress.tr,
                            style: styleSheet.textTheme.fs16Normal
                                .copyWith(color: styleSheet.colors.gray),
                          ),
                          trailing: SvgPicture.asset(
                            styleSheet.icons.rightArrow2,
                            height: 17.sp,
                            width: 17.sp,
                          ),
                        ).paddingOnly(top: 10.h, bottom: 10.h),
                        Divider(thickness: 1),
                        ListTile(
                          onTap: () {
                            Get.toNamed(RoutesName.addNewAddressScreen);
                          },
                          horizontalTitleGap: 0,
                          minTileHeight: 15.h,
                          contentPadding: EdgeInsets.zero,
                          iconColor: styleSheet.colors.black,
                          leading: Icon(Icons.my_location_sharp),
                          title: Text(
                            LanguageConst.addAddress.tr,
                            style: styleSheet.textTheme.fs16Normal
                                .copyWith(color: styleSheet.colors.gray),
                          ),
                          subtitle: GetBuilder<GoogleMapGetXController>(
                            builder: (mapcontroller) {
                              return Text(mapcontroller.userLiveAddress,
                                  style: styleSheet.textTheme.fs16Normal
                                      .copyWith(
                                          color: styleSheet.colors.black));
                            },
                          ),
                        ).paddingOnly(top: 10.h, bottom: 10.h),
                      ],
                    ),
                  ),
                  styleSheet.services.addheight(15.h),
                  Text(LanguageConst.yourSavedAddresses.tr,
                      style: styleSheet.textTheme.fs14Normal),
                  styleSheet.services.addheight(15.h),
                  ...List.generate(
                    addressdata.length,
                    (index) {
                      return PrimaryContainer(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.r),
                                decoration: BoxDecoration(
                                    color: styleSheet.colors.white,
                                    border: Border.all(
                                        color: styleSheet.colors.gray),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.home,
                                  size: 24.sp,
                                ),
                              ),
                              styleSheet.services.addwidth(10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(LanguageConst.addAddress.tr,
                                      style: styleSheet.textTheme.fs16Normal
                                          .copyWith(
                                              color: styleSheet.colors.gray)),
                                  styleSheet.services.addheight(10.h),
                                  SizedBox(
                                    width: styleSheet.services
                                            .screenWidth(context) *
                                        0.5,
                                    child: Text(
                                      "${(addressdata[index].addressTitle)}",
                                      style: styleSheet.textTheme.fs14Normal
                                          .copyWith(height: 1.2.h),
                                    ),
                                  ),
                                  // styleSheet.services.addheight(10.h),
                                  // Text("Hisar,  Haryana ",
                                  //     style: styleSheet.textTheme.fs14Normal),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                controller
                                    .removeUserAddress(addressdata[index]);
                              },
                              icon: Icon(Icons.delete))
                        ],
                      )).marginOnly(bottom: 10.h);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
