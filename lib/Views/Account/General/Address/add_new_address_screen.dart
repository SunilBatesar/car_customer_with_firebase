// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Buttons/second_primary_button.dart';
import 'package:car_booking_customer/Components/TextFields/secondary_text_form_field.dart';
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
  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = LatLng(29.1492, 75.7217);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  // ignore: unused_element
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(LanguageConst.addNewAddress.tr),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
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
                  iconOnTap: (){},
                ),
                styleSheet.services.addheight(15.h),
                SizedBox(
                  height: styleSheet.services.screenHeight(context) * 0.4,
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 18.0,
                    ),
                    mapType: _currentMapType,
                    markers: _markers,
                    onCameraMove: _onCameraMove,
                  ),
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
                                      hintStyle:
                                          styleSheet.textTheme.fs14Normal,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "+91",
                                            style: styleSheet
                                                .textTheme.fs14Normal
                                                .copyWith(
                                                    color:
                                                        styleSheet.colors.gray),
                                          ),
                                        ],
                                      ),
                                      hintText: LanguageConst.contactNumber.tr,
                                      hintStyle:
                                          styleSheet.textTheme.fs14Normal,
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
