import 'dart:io';

import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickBottomsheet extends StatelessWidget {
  String? title;
  Function(File) file;
  ImagePickBottomsheet({super.key, this.title, required this.file});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      decoration: BoxDecoration(
          color: styleSheet.colors.bgclr,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(styleSheet.icons.arrowUp)),
          ),
          styleSheet.services.addheight(15.h),
          Text(
            title ?? "",
            style: styleSheet.textTheme.fs16Normal,
          ),
          styleSheet.services.addheight(15.h),
          Divider(
            color: styleSheet.colors.gray,
          ),
          styleSheet.services.addheight(15.h),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final imagePath = await getImageFormGallery();
                    file(File(imagePath));
                    Get.back();
                  },
                  child: PrimaryContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(styleSheet.images.gallery),
                        styleSheet.services.addheight(10.h),
                        Text(
                          LanguageConst.gallery.tr,
                          style: styleSheet.textTheme.fs16Normal,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              styleSheet.services.addwidth(30.w),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                    final imagePath = await getImageFormCamera();
                    file(File(imagePath));
                    Get.back();
                  },
                  child: PrimaryContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(styleSheet.images.camera),
                        styleSheet.services.addheight(10.h),
                        Text(
                          LanguageConst.camera.tr,
                          style: styleSheet.textTheme.fs16Normal,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<String> getImageFormGallery() async {
  final ImagePicker picker = ImagePicker();
  // ignore: invalid_use_of_visible_for_testing_member
  var getImage = await picker.pickImage(source: ImageSource.gallery);
  // .getImageFromSource(source: ImageSource.gallery);

  String image = '';

  if (getImage != null) {
    image = getImage.path;
  }

  return image;
}

// Get Image Camra
Future<String> getImageFormCamera() async {
  var getImage =
      // ignore: invalid_use_of_visible_for_testing_member
      await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
  String image = '';
  if (getImage != null) {
    image = getImage.path;
  }
  return image;
}
