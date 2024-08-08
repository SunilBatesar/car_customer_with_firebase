import 'package:car_booking_customer/Components/Widgets/message_contain.dart';
import 'package:car_booking_customer/Models/messagemodel.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomerServicesScreen extends StatefulWidget {
  const CustomerServicesScreen({super.key});

  @override
  State<CustomerServicesScreen> createState() => _CustomerServicesScreenState();
}

class _CustomerServicesScreenState extends State<CustomerServicesScreen> {
  TextEditingController chat_controller = TextEditingController();
  int textformfieldvalue = 0;
  final ScrollController _scrollController = ScrollController();

  List<MessageModel> mylist = [];
  FocusNode focusnode = FocusNode();
  String formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime);
  }

  bool show = false;
  @override
  void initState() {
    super.initState();
    focusnode.addListener(() {
      if (focusnode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: styleSheet.colors.black,
            )),
        title: Text(
          LanguageConst.customerService.tr,
          style: styleSheet.textTheme.fs24Normal
              .copyWith(color: styleSheet.colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.phone,
                color: styleSheet.colors.black,
              ))
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: mylist.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        MessageContainwidget(
                          index: index,
                          message: mylist[index].mostRecentMessage,
                          isSeen: false,
                          isMe: false,
                          time: mylist[index].messageDate,
                          onPress: () {},
                          listLength: mylist.length,
                          type: mylist[index].type,
                        )
                      ],
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.all(6.sp),
              decoration: BoxDecoration(
                  color: styleSheet.colors.black,
                  border: Border.all(color: styleSheet.colors.black),
                  borderRadius: BorderRadius.circular(50.r)),
              width: styleSheet.services.screenWidth(context),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {
                          focusnode.unfocus();
                          focusnode.canRequestFocus = false;
                          setState(() {
                            show = !show;
                          });
                        },
                        icon: Icon(
                          Icons.emoji_emotions_outlined,
                          color: styleSheet.colors.white,
                        )),
                  ),
                  Flexible(
                    flex: 4,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                          color: styleSheet.colors.white,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Row(children: [
                        Expanded(
                            child: TextFormField(
                          focusNode: focusnode,
                          controller: chat_controller,
                          maxLines: 5,
                          minLines: 1,
                          onChanged: (value) {
                            setState(() {
                              textformfieldvalue = value.length;
                            });
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: LanguageConst.message.tr),
                        )),
                      ]),
                    ),
                  ),
                  styleSheet.services.addwidth(10.w),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          styleSheet.icons.share,
                        ),
                      ),
                      styleSheet.services.addwidth(10.w),
                      GestureDetector(
                        onTap: () {
                          if (chat_controller.text.isNotEmpty) {
                            var now = DateTime.now();
                            var messageitm = MessageModel(
                                chat_controller.text, formatTime(now), '');
                            mylist.add(messageitm);
                            _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 2),
                                curve: Curves.bounceIn);
                            chat_controller.clear();
                            setState(() {});
                          }
                        },
                        child: SvgPicture.asset(
                          styleSheet.icons.send,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            show ? emojiSelected() : SizedBox()
          ],
        ),
      ),
    );
  }

  emojiSelected() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        setState(() {
          chat_controller.text = chat_controller.text + emoji.emoji;
        });
      },
    );
  }
}
