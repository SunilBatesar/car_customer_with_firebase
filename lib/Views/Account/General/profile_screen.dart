import 'dart:io';

import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Bottom%20Sheets/image_pick_bottomsheet.dart';
import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/TextFields/primary_text_form_field.dart';
import 'package:car_booking_customer/Components/TextFields/secondary_text_form_field.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/Data/Network/firestorage.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();

  // File
  File? imageFile;
  @override
  void initState() {
    super.initState();
    initialize();
  }

  final userController = Get.find<UserController>();
  String userDp = "";
  initialize() {
    userDp = userController.userdata.data!.image.toString();
    emailController.text = userController.userdata.data!.email.toString();
    mobileController.text =
        userController.userdata.data!.phonenumber.toString();
    nameController.text = userController.userdata.data!.name.toString();
    addressController.text =
        userController.userdata.data!.titleAddress.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text(LanguageConst.profile.tr)),
      body: Padding(
        padding: EdgeInsets.all(15.sp).copyWith(top: 0),
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: ListView(
                  children: [
                    Text(
                      LanguageConst.pleaseCAAYNDFYBP.tr,
                      style: styleSheet.textTheme.fs14Normal,
                    ),
                    styleSheet.services.addheight(15.h),
                    Align(
                      alignment: Alignment.center,
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: imageFile == null
                              ? (userDp.isNotEmpty
                                  ? Image.network(
                                      userController.userdata.data!.image!,
                                      height: 75.sp,
                                      width: 75.sp,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      styleSheet.images.Bg_img,
                                      height: 75.sp,
                                      width: 75.sp,
                                      fit: BoxFit.cover,
                                    ))
                              : Image.file(
                                  imageFile!,
                                  height: 75.sp,
                                  width: 75.sp,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Positioned(
                          bottom: 2,
                          right: 0.2,
                          child: GestureDetector(
                            onTap: () async {
                              await Get.bottomSheet(ImagePickBottomsheet(
                                title: LanguageConst.profilePhoto.tr,
                                file: (file) {
                                  if (file.path.isNotEmpty) {
                                    setState(() {
                                      imageFile = file;
                                    });
                                  }
                                },
                              ));
                            },
                            child: Container(
                              padding: EdgeInsets.all(4.sp),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: styleSheet.colors.white,
                              ),
                              child:
                                  SvgPicture.asset(styleSheet.icons.editIcon),
                            ),
                          ),
                        )
                      ]),
                    ),
                    styleSheet.services.addheight(15.h),
                    PrimaryTextFormField(
                      hinttext: LanguageConst.enterYourName.tr,
                      hinttextColor: styleSheet.colors.lightgray,
                      title: LanguageConst.name.tr,
                      titleColor: styleSheet.colors.black,
                      controller: nameController,
                    ),
                    styleSheet.services.addheight(20.h),
                    SecondaryTextFormField(
                      controller: emailController,
                      icon: styleSheet.icons.mail,
                      hinttext: LanguageConst.enterYe.tr,
                      title: LanguageConst.email.tr,
                      keyboardtype: TextInputType.emailAddress,
                      iconOnTap: () {},
                    ),
                    styleSheet.services.addheight(20.h),
                    SecondaryTextFormField(
                      controller: mobileController,
                      icon: styleSheet.icons.phone,
                      hinttext: LanguageConst.enterYpn.tr,
                      title: LanguageConst.mobile.tr,
                      keyboardtype: TextInputType.phone,
                      iconOnTap: () {},
                    ),
                    styleSheet.services.addheight(20.h),
                    SecondaryTextFormField(
                      controller: addressController,
                      icon: styleSheet.icons.location2,
                      hinttext: LanguageConst.location.tr,
                      title: LanguageConst.location.tr,
                      iconColor: styleSheet.colors.lightgray,
                      iconOnTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.0.sp).copyWith(top: 0),
        child: PrimaryButton(
          title: LanguageConst.save.tr,
          onPressed: () async {
            final storageFunction = FirestorageFuction();

            String userImageURL = userDp;

            if (imageFile != null && imageFile!.path.isNotEmpty) {
              if (userDp.isNotEmpty) {
                userImageURL =
                    await storageFunction.updatefile(userDp, imageFile!);
              } else {
                userImageURL = await storageFunction.uploadFile(imageFile!);
              }
            }
            final data = userController.userdata.data!.copyWith(
                name: nameController.text.trim(),
                image: userImageURL,
                phonenumber: mobileController.text.trim(),
                titleAddress: addressController.text.trim());
            await userController.updateuserprofile(data);
            Get.back();
          },
          isExpanded: true,
        ),
      ),
    );
  }
}
