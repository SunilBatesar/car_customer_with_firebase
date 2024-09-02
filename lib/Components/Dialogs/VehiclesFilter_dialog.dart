import 'package:car_booking_customer/Classes/manage_data.dart';
import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Data/Localdata/localdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? selectedCategory;
  Map<String, String?> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    // for (var filter in VehicleLocalData.vehicleDataFilter) {
    //   String key = filter.keys.first;
    //   selectedOptions[key] = null;
    // }
    // selectedCategory = VehicleLocalData.vehicleDataFilter.first.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> vehicleData = Localdata.vehicleDataFilter;
    final manageData = ConstantSheet.instance;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      insetPadding: EdgeInsets.all(15.sp),
      child: Container(
        padding: EdgeInsets.all(10.0.sp),
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: vehicleData.length,
                      itemBuilder: (context, index) {
                        String key = vehicleData[index].keys.first;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = key;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0.h),
                            child: Text(
                              key,
                              style: manageData.textTheme.fs14Normal,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.grey),
                  Flexible(
                    flex: 2,
                    child: selectedCategory == null
                        ? Center(child: Text('Select a category'))
                        : ListView.builder(
                            itemCount: vehicleData.length,
                            itemBuilder: (context, index) {
                              String key = vehicleData[index].keys.first;
                              if (key != selectedCategory) return Container();
                              List<String> values =
                                  List<String>.from(vehicleData[index][key]);
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: values.map((value) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedOptions[key] =
                                            selectedOptions[key] == value
                                                ? null
                                                : value;
                                      });
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.h,
                                        horizontal: 16.0.w,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            value,
                                            style:
                                                manageData.textTheme.fs14Normal,
                                          ),
                                          selectedOptions[key] == value
                                              ? SvgPicture.asset(
                                                  manageData.images.payment,
                                                  color:
                                                      manageData.colors.black,
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SimpleButton(
                title: "Save",
                onPressed: () {
                  // ignore: avoid_print
                  print(selectedOptions);
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
