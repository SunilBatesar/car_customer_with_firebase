import 'package:car_booking_customer/Components/Tiles/car_part_text_icon.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RentalCarTile extends StatefulWidget {
  final Function onPressed;
  const RentalCarTile({
    super.key,
    required this.onPressed,
  });

  @override
  State<RentalCarTile> createState() => _RentalCarTileState();
}

class _RentalCarTileState extends State<RentalCarTile> {
  final GlobalKey _cardKey = GlobalKey();

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
    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14.r),
        child: Stack(
          children: [
            Container(
              key: _cardKey,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(styleSheet.images.toyotacar)),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
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
                      "₹ 1,200",
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
                                title: LanguageConst.petrol.tr,
                                iconpath: styleSheet.icons.petrol),
                            styleSheet.services.addwidth(10.w),
                            CarPartTextIcon(
                                title: LanguageConst.auto.tr,
                                iconpath: styleSheet.icons.gear),
                            styleSheet.services.addwidth(10.w),
                            CarPartTextIcon(
                                title: "7 ${LanguageConst.seats.tr}",
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
                  "Toyota Innova",
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
