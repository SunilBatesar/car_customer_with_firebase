import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Tiles/find_car_tile.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCarsViewScreen extends StatelessWidget {
  const AllCarsViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text("Top Rental Car’s"),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.0.sp),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (context, index) => FindCarTile(
                    onPressed: () {
                      Get.toNamed(RoutesName.carPreviewScreen);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
