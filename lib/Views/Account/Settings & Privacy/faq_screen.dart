import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  final List<Faqitems> _faqitems = [
    Faqitems(
      question: "What is your name",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Diam pretium aenean proin faucibus sed commodo consequat.",
      isvisible: true,
    ),
    Faqitems(
      question: "Can we cancel at any time ?",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Diam pretium aenean proin faucibus sed commodo consequat.",
      isvisible: false,
    ),
    Faqitems(
      question: "Does flow require minimum flow of user’s ?",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Diam pretium aenean proin faucibus sed commodo consequat.",
      isvisible: false,
    ),
    Faqitems(
      question: "What’s your Refund Policy ?",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Diam pretium aenean proin faucibus sed commodo consequat.",
      isvisible: false,
    ),
    Faqitems(
      question: "Where are my payment options",
      answer:
          "Lorem ipsum dolor sit amet consectetur. Diam pretium aenean proin faucibus sed commodo consequat.",
      isvisible: false,
    )
  ];

  final List<String> items = ['View', 'Edit', 'Delete'];
  String? selectedValue;
  List<int> cruntindexList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: Text(LanguageConst.faqs.tr)),
      body: Padding(
        padding: EdgeInsets.all(15.0.sp).copyWith(top: 0),
        child: ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(overscroll: false),
          child: ListView(
            children: [
              ListView.builder(
                itemCount: _faqitems.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = _faqitems[index];
                  return Container(
                    // padding: EdgeInsets.symmetric(vertical: 7.h),
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                        // color: styleSheet.colors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Column(
                      children: [
                        ExpansionTile(
                          onExpansionChanged: (value) {
                            if (cruntindexList.any((e) => e == index)) {
                              cruntindexList.remove(index);
                            } else {
                              cruntindexList.add(index);
                            }
                            setState(() {});
                          },
                          leading: Text(
                            "${LanguageConst.q.tr} ${index + 1} .",
                            style: styleSheet.textTheme.fs16Normal,
                          ),
                          iconColor: styleSheet.colors.primary,
                          textColor: styleSheet.colors.primary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          title: Text(
                            item.question,
                            style: styleSheet.textTheme.fs16Normal,
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: styleSheet.colors.gray,
                                )),
                            child: Icon(
                              cruntindexList.any((e) => e == index)
                                  ? Icons.close_outlined
                                  : Icons.keyboard_arrow_down_rounded,
                              color: styleSheet.colors.gray,
                              size: 24.sp,
                            ),
                          ),
                          children: [
                            ListTile(
                              minLeadingWidth: 0,
                              leading: Text(
                                LanguageConst.a.tr,
                                style: styleSheet.textTheme.fs16Normal,
                              ),
                              title: Container(
                                  padding: EdgeInsets.all(10.sp),
                                  decoration: BoxDecoration(
                                      color: styleSheet.colors.white,
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Text(
                                    item.answer,
                                    style: styleSheet.textTheme.fs16Normal,
                                  )),
                            ),
                          ],
                        ),
                        Divider(
                          color: styleSheet.colors.gray,
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Faqitems {
  final String question;
  final String answer;
  bool isvisible;
  Faqitems(
      {required this.question, required this.answer, this.isvisible = false});
}
