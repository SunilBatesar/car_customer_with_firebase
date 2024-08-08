import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Views/Car%20Perview/image_show_screen.dart';
import 'package:car_booking_customer/Views/Car%20Perview/video_show_screen.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ImageVideoListScreen extends StatelessWidget {
  ImageVideoListScreen({super.key});

  final List<String> images = [
    styleSheet.images.toyotacar,
    styleSheet.images.swift,
    styleSheet.images.toyotacar,
    styleSheet.images.swift,
    styleSheet.images.toyotacar,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text(LanguageConst.photos.tr)),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0.sp).copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  itemCount: images.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(ImageShowScreen(
                            image: images[index], imageList: images));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          images[index],
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                styleSheet.services.addheight(15),
                Text(
                  LanguageConst.videos.tr,
                  style: styleSheet.textTheme.fs18Normal,
                ),
                styleSheet.services.addheight(15),
                GridView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2.5,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(VideoShowScreen());
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                              images[index],
                              height: 400.h,
                              width: styleSheet.services.screenWidth(context),
                              fit: BoxFit.cover,
                            ),
                            SvgPicture.asset(styleSheet.icons.playbtn),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
