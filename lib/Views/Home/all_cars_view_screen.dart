import 'package:car_booking_customer/Components/AppBar/custom_appbar.dart';
import 'package:car_booking_customer/Components/Tiles/find_car_tile.dart';
import 'package:car_booking_customer/Controllers/car_controller.dart';
import 'package:car_booking_customer/Views/Car%20Perview/carperview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllCarsViewScreen extends StatelessWidget {
  AllCarsViewScreen({super.key});
  final carController = Get.find<CarController>();
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
                  itemCount: carController.carData.data!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (context, index) => FindCarTile(
                    onPressed: () {
                      Get.to(() => CarPreviewScreen(
                          model: carController.carData.data![index]));
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
