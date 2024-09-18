// ignore_for_file: prefer_const_constructors_in_immutables, unused_element

import 'dart:async';

import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Buttons/second_primary_button.dart';
import 'package:car_booking_customer/Components/TextFields/secondary_text_form_field.dart';
import 'package:car_booking_customer/Controllers/google_map_controller.dart';
import 'package:car_booking_customer/Data/Functions/app_functions.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddNewAddressScreen extends StatefulWidget {
  AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  final searchcontroller = TextEditingController();
  final addressTileController = TextEditingController();
  Completer<GoogleMapController> mapcontroller = Completer(); // MAP CONTROLLER

  // MapType _currentMapType = MapType.normal;

  // void _onMapTypeButtonPressed() {
  //   setState(() {
  //     _currentMapType = _currentMapType == MapType.normal
  //         ? MapType.satellite
  //         : MapType.normal;
  //   });
  // }

  //  ON MAP CREATED
  void _onMapCreated(GoogleMapController controller) {
    mapcontroller.complete(controller);
  }

  @override
  void initState() {
    super.initState();
    location(); // FUNCTION
  }

  location() async {
    final controller =
        Get.find<GoogleMapGetXController>(); // GOOGLEMAPGETXCONTROLLER
    await controller
        .getUserCurrentLocation(mapcontroller); // GET USER CURRENT LOCATION
    addressTileController.text =
        await AppFunctions.userFullAddress(controller.center);
  }

  final googleMapGtxcontroller =
      Get.find<GoogleMapGetXController>(); // GOOGLEMAPGETXCONTROLLER
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(LanguageConst.addNewAddress.tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SecondaryTextFormField(
              controller: searchcontroller,
              hinttext: LanguageConst.searchFASA.tr,
              icon: styleSheet.icons.search,
              iconColor: styleSheet.colors.gray,
              icon2: styleSheet.icons.mic,
              icon2Color: styleSheet.colors.gray,
              iconOnTap: () {},
            ),
            styleSheet.services.addheight(15.h),
            //**** GET BUILDER CALL AND USE GOOGLEMAPGETXCONTROLLER ****//
            GetBuilder<GoogleMapGetXController>(
              builder: (controller) {
                return SizedBox(
                  height: styleSheet.services.screenHeight(context) * 0.37,
                  //**** GOOGLE MAP ****//
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: controller.cameraPosition,
                    mapType: MapType.normal,
                    markers: Set<Marker>.of(controller.markers),
                    onTap: (argument) async {
                      controller.markersUpdate(
                          argument, mapcontroller); //MARKERS UPDATE
                      addressTileController.text =
                          await AppFunctions.userFullAddress(argument);
                      setState(() {});
                    },
                  ),
                );
              },
            ),
            Container(
              padding: EdgeInsets.all(12.sp),
              decoration: BoxDecoration(
                  color: styleSheet.colors.white,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageConst.houseNoBuildingName.tr,
                    style: styleSheet.textTheme.fs12Normal,
                  ),
                  styleSheet.services.addheight(10.h),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: LanguageConst.enterHouseNo.tr,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: styleSheet.colors.gray),
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                  styleSheet.services.addheight(10.h),
                  Text(
                    LanguageConst.addressTitle.tr,
                    style: styleSheet.textTheme.fs12Normal,
                  ),
                  styleSheet.services.addheight(10.h),
                  TextFormField(
                    controller: addressTileController,
                    decoration: InputDecoration(
                        hintText: LanguageConst.addressTitle.tr,
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: styleSheet.colors.gray),
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                  styleSheet.services.addheight(10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LanguageConst.contactName.tr,
                              style: styleSheet.textTheme.fs12Normal,
                            ),
                            styleSheet.services.addheight(10.h),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: LanguageConst.contactName.tr,
                                  hintStyle: styleSheet.textTheme.fs14Normal,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: styleSheet.colors.gray),
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              keyboardType: TextInputType.name,
                            ),
                          ],
                        ),
                      ),
                      styleSheet.services.addwidth(20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LanguageConst.contactNumber.tr,
                              style: styleSheet.textTheme.fs12Normal,
                            ),
                            styleSheet.services.addheight(10.h),
                            TextFormField(
                              decoration: InputDecoration(
                                  prefixIcon: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "+91",
                                        style: styleSheet.textTheme.fs14Normal
                                            .copyWith(
                                                color: styleSheet.colors.gray),
                                      ),
                                    ],
                                  ),
                                  hintText: LanguageConst.contactNumber.tr,
                                  hintStyle: styleSheet.textTheme.fs14Normal,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: styleSheet.colors.gray),
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.sp).copyWith(top: 0),
        child: SecondPrimaryButton(
          title: LanguageConst.addNewAddress.tr,
          onPressed: () {},
          icon: styleSheet.icons.addIcon,
          iconColor: styleSheet.colors.white,
          isExpanded: true,
        ),
      ),
    );
  }
}
