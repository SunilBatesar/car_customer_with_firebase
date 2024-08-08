import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MessageContainwidget extends StatelessWidget {
  MessageContainwidget({
    super.key,
    required this.isMe,
    required this.message,
    required this.time,
    required this.onPress,
    required this.index,
    required this.listLength,
    required this.isSeen,
    required this.type,
  });

  final bool isMe;
  final String message, type;
  final String time;
  final VoidCallback onPress;
  int index;
  int listLength;
  bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        children: [
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
            padding: EdgeInsets.all(15.sp),
            // width: styleSheet.services.screenWidth(context) * 0.65,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r)),
                color: styleSheet.colors.primary),
            child: Text(message.toString(),
                style: styleSheet.textTheme.fs14Normal
                    .copyWith(color: styleSheet.colors.white)),
          ),
          styleSheet.services.addheight(2.h),
          Text(time.toString(),
              style: styleSheet.textTheme.fs14Normal
                  .copyWith(color: styleSheet.colors.primary)),
          styleSheet.services.addheight(15.h),
        ],
      ),
    );
  }
}
