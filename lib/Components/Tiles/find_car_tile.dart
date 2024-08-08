import 'package:car_booking_customer/Components/Tiles/car_part_text_icon.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FindCarTile extends StatefulWidget {
  final Function onPressed;
  const FindCarTile({
    super.key,
    required this.onPressed,
  });

  @override
  State<FindCarTile> createState() => _FindCarTileState();
}

class _FindCarTileState extends State<FindCarTile> {
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.r),
      child: GestureDetector(
        onTap: () {
          widget.onPressed();
        },
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
                      style: styleSheet.textTheme.fs18Bold
                          .copyWith(color: styleSheet.colors.white),
                    ).paddingOnly(left: 10.w, bottom: 2.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            CarPartTextIcon(
                                title: "Petrol",
                                iconpath: styleSheet.icons.petrol),
                            styleSheet.services.addwidth(5.w),
                            CarPartTextIcon(
                                title: "Auto", iconpath: styleSheet.icons.gear),
                            styleSheet.services.addwidth(5.w),
                            CarPartTextIcon(
                                title: "7 Seats",
                                iconpath: styleSheet.icons.seat),
                          ],
                        ).paddingOnly(right: 2.w, bottom: 5.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: styleSheet.colors.lightgreen,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(14.r),
                                bottomRight: Radius.circular(14.r)),
                          ),
                          child: Text(
                            "See details",
                            style: styleSheet.textTheme.fs12Normal
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
              top: 5,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                decoration: BoxDecoration(
                    color: styleSheet.colors.black,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(14.r),
                        topRight: Radius.circular(14.r))),
                child: Text(
                  "Toyota Innova",
                  style: styleSheet.textTheme.fs16Bold
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
