import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImageShowScreen extends StatefulWidget {
  String image;
  final List<String> imageList;
  ImageShowScreen({
    super.key,
    required this.image,
    required this.imageList,
  });

  @override
  State<ImageShowScreen> createState() => _ImageShowScreenState();
}

class _ImageShowScreenState extends State<ImageShowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: styleSheet.colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24.sp,
            color: styleSheet.colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Column(
          children: [
            InteractiveViewer(
                child: CachedNetworkImage(
              fit: BoxFit.contain,
              width: styleSheet.services.screenWidth(context),
              height: styleSheet.services.screenHeight(context) * 0.7,
              imageUrl: widget.image,
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
            )),
            Spacer(),
            SizedBox(
              height: 50.h,
              width: styleSheet.services.screenWidth(context) * 0.7,
              child: ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: ListView.builder(
                  itemCount: widget.imageList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.image = widget.imageList[index];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.w),
                      decoration: BoxDecoration(
                          border: widget.image == widget.imageList[index]
                              ? Border.all(
                                  color: styleSheet.colors.white,
                                  width: 2,
                                )
                              : null,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: CachedNetworkImage(
                          width: 50.w,
                          fit: BoxFit.cover,
                          imageUrl: widget.imageList[index],
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
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
