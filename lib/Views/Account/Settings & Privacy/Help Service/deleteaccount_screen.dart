import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Components/Dialogs/delete_profile_dialog.dart';
import 'package:car_booking_customer/Data/Localdata/localdata.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeleteaccountScreen extends StatefulWidget {
  const DeleteaccountScreen({super.key});

  @override
  State<DeleteaccountScreen> createState() => _DeleteaccountScreenState();
}

class _DeleteaccountScreenState extends State<DeleteaccountScreen> {
  int? selectedValue;
  TextEditingController reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(15.0.sp).copyWith(top: 0),
        child: Row(
          children: [
            Expanded(
                child: PrimaryButton(
                    title: LanguageConst.continueText.tr,
                    onPressed: () {
                      Get.dialog(DeleteProfileDialog());
                    }))
          ],
        ),
      ),
      appBar: CustomAppbar(title: Text(LanguageConst.deleteAccount.tr)),
      body: Padding(
        padding: EdgeInsets.all(15.sp).copyWith(top: 0),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            children: [
              Text(
                LanguageConst.ifYWTDAYAPTPRFDA.tr,
                style: styleSheet.textTheme.fs14Normal,
              ),
              styleSheet.services.addheight(15.h),
              ...List.generate(
                Localdata.deleteAccountData.length,
                (index) => Container(
                  margin: EdgeInsets.only(bottom: 15.h),
                  decoration: BoxDecoration(
                      color: styleSheet.colors.white,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: Column(
                    children: [
                      RadioListTile<int>(
                        activeColor: styleSheet.colors.primary,
                        title: Text(
                          Localdata.deleteAccountData[index].title.tr,
                          style: styleSheet.textTheme.fs16Normal,
                        ),
                        value: index,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                      ),
                      if (selectedValue == 6 && index == 6)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          child: TextFormField(
                            maxLines: 5,
                            controller: reasonController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: styleSheet.colors.bgclr,
                              hintText: LanguageConst.typeHere.tr,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
