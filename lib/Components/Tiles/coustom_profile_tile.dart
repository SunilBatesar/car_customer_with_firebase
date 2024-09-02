import 'package:car_booking_customer/Components/Tiles/primary_container.dart';
import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CoustomProfileTile extends StatelessWidget {
  CoustomProfileTile({super.key});
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      color: styleSheet.colors.black,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.sp),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          styleSheet.images.girlprofile,
                          height: 40.sp,
                          width: 40.sp,
                          fit: BoxFit.contain,
                        ),
                      ),
                      styleSheet.services.addwidth(15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userController.userdata.data!.name ?? "",
                            style: styleSheet.textTheme.fs20Medium
                                .copyWith(color: styleSheet.colors.white),
                          ),
                          Text(
                            userController.userdata.data!.email!,
                            style: styleSheet.textTheme.fs14Normal
                                .copyWith(color: styleSheet.colors.white),
                          ),
                          Text(
                            "Hisar, Haryana",
                            style: styleSheet.textTheme.fs14Normal
                                .copyWith(color: styleSheet.colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Available Balance",
                          style: styleSheet.textTheme.fs12Normal
                              .copyWith(color: styleSheet.colors.darkgray),
                        ),
                        Text.rich(TextSpan(
                            text: "₹ ",
                            style: styleSheet.textTheme.fs12Normal
                                .copyWith(color: styleSheet.colors.green),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "1,200",
                                  style: styleSheet.textTheme.fs20Medium)
                            ])),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
