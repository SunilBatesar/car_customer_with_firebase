import 'package:car_booking_customer/Extensions/extensions.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePackageModelDropdownButton extends StatelessWidget {
  final String title;
  final String? hint;
  final PackageType onvalue;
  final List<PackageType?> items;
  final Function(PackageType) onChangedvalue;
  const CreatePackageModelDropdownButton({
    super.key,
    required this.title,
    this.hint,
    required this.items,
    required this.onvalue,
    required this.onChangedvalue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: styleSheet.textTheme.fs16Normal
              .copyWith(color: styleSheet.colors.black),
        ),
        styleSheet.services.addheight(10.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: styleSheet.colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: styleSheet.colors.lightgray)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                isExpanded: true,
                hint: hint != null
                    ? Text(hint!, style: styleSheet.textTheme.fs16Normal)
                    : null,
                items: items
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e!.name.toString().toCapitalized,
                            style: styleSheet.textTheme.fs16Normal)))
                    .toList(),
                value: onvalue,
                onChanged: (v) {
                  onChangedvalue(v!);
                }),
          ),
        ),
      ],
    );
  }
}
