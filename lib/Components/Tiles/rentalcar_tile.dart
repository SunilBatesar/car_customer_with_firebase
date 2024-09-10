import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_booking_customer/Components/Tiles/car_part_text_icon.dart';
import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RentalCarTile extends StatefulWidget {
  final Function onPressed;
  final String id;
  const RentalCarTile({
    super.key,
    required this.onPressed,
    required this.id,
  });

  @override
  State<RentalCarTile> createState() => _RentalCarTileState();
}

class _RentalCarTileState extends State<RentalCarTile> {
  final GlobalKey _cardKey = GlobalKey();
  final carController = Get.find<CarController>();

  Size _cardHeight = const Size(0, 0);
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox =
          _cardKey.currentContext?.findRenderObject() as RenderBox;
      _cardHeight = renderBox.size;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardata = carController.carData.data!
        .firstWhere((e) => e.id == widget.id, orElse: () => CarModel());
    List<CreatePackageModel> bestpackageList = cardata.package!;
    bestpackageList.sort((a, b) => a.ammount!.compareTo(b.ammount!));

    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: cardata.image!.first,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(fit: BoxFit.cover, image: imageProvider),
                ),
              ),
              placeholder: (context, url) => Center(
                child: SizedBox(
                    height: 25.sp,
                    width: 25.sp,
                    child: CircularProgressIndicator(
                      color: styleSheet.colors.white,
                    )),
              ),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                key: _cardKey,
                width: _cardHeight.width,
                height: _cardHeight.height * 0.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black.withOpacity(0),
                      Colors.black,
                    ])),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹ ${bestpackageList.first.ammount}",
                      style: styleSheet.textTheme.fs24Bold
                          .copyWith(color: styleSheet.colors.white),
                    ).paddingOnly(left: 19.w, bottom: 5.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            CarPartTextIcon(
                                title: cardata.fuel ?? "",
                                iconpath: styleSheet.icons.petrol),
                            styleSheet.services.addwidth(10.w),
                            CarPartTextIcon(
                                title: cardata.transmission ?? "",
                                iconpath: styleSheet.icons.gear),
                            styleSheet.services.addwidth(10.w),
                            CarPartTextIcon(
                                title:
                                    "${cardata.seatingcapacity} ${LanguageConst.seats.tr}",
                                iconpath: styleSheet.icons.seat),
                          ],
                        ).paddingOnly(right: 10.w, bottom: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: styleSheet.colors.lightgreen,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14.r),
                                bottomRight: Radius.circular(14.r)),
                          ),
                          child: Text(
                            LanguageConst.seeD.tr,
                            style: styleSheet.textTheme.fs14Normal
                                .copyWith(color: styleSheet.colors.primary),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
                decoration: BoxDecoration(
                    color: styleSheet.colors.black,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(14.r),
                        topRight: Radius.circular(14.r))),
                child: Text(
                  cardata.carmodel ?? "",
                  style: styleSheet.textTheme.fs18Normal
                      .copyWith(color: styleSheet.colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
