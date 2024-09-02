import 'package:car_booking_customer/Components/Buttons/primary_button.dart';
import 'package:car_booking_customer/Data/Localdata/localdata.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FilterDialogState createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String? selectedCategory;
  Map<String, dynamic> selectedOptions = {};

  @override
  void initState() {
    super.initState();
    if (Localdata.vehicleDataFilter.isNotEmpty) {
      selectedCategory = Localdata.vehicleDataFilter.first.keys.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> vehicleData = Localdata.vehicleDataFilter;

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
                    flex: 2,
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
                              style: styleSheet.textTheme.fs14Normal,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  VerticalDivider(thickness: 1, color: Colors.grey),
                  Flexible(
                    flex: 3,
                    child: _buildCategoryOptions(
                      selectedCategory ?? vehicleData.first.keys.first,
                      vehicleData,
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
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryOptions(
    String category,
    List<Map<String, dynamic>> vehicleData,
  ) {
    var categoryData =
        vehicleData.firstWhere((data) => data.keys.first == category);
    List<String> values = List<String>.from(categoryData[category]);
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (context, index) {
        String value = values[index];
        bool isSelected = selectedOptions[category]?.contains(value) ?? false;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: styleSheet.textTheme.fs14Normal,
              ),
              Checkbox(
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                splashRadius: 0.0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                checkColor: Colors.white,
                activeColor: styleSheet.colors.primary,
                value: isSelected,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                onChanged: (newValue) {
                  setState(() {
                    if (newValue == true) {
                      if (selectedOptions[category] == null) {
                        selectedOptions[category] = [];
                      }
                      selectedOptions[category]?.add(value);
                    } else {
                      selectedOptions[category]?.remove(value);
                    }
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
