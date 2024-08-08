// import 'package:car_booking_customer/main.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class PaymentMethodTile extends StatefulWidget {
  String title;
  String subtitle;
  String leadingicon;
  bool trailingicon;
  Color? bordercolor;
  Function onpressed;
  PaymentMethodTile(
      {super.key,
      required this.title,
      required this.onpressed,
      required this.subtitle,
      this.bordercolor,
      this.trailingicon = false,
      required this.leadingicon});

  @override
  State<PaymentMethodTile> createState() => _PaymentMethodTileState();
}

class _PaymentMethodTileState extends State<PaymentMethodTile> {
  bool _isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      decoration: BoxDecoration(
        border: Border.all(color: widget.bordercolor ?? styleSheet.colors.gray),
        color: styleSheet.colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: ListTile(
        onTap: () {
          widget.onpressed();
        },
        minLeadingWidth: 0,
        trailing: widget.trailingicon == true
            ? Checkbox(
                activeColor: styleSheet.colors.primary,
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value!;
                  });
                },
              )
            : SizedBox(),
        leading: Container(
            alignment: Alignment.center,
            height: 45.sp,
            width: 45.sp,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:
                    Border.all(color: styleSheet.colors.gray.withOpacity(0.4))),
            child: SvgPicture.asset(
              widget.leadingicon,
              fit: BoxFit.cover,
            )),
        title: Text(
          widget.title,
          style: styleSheet.textTheme.fs18Medium,
        ),
        subtitle: Text(
          widget.subtitle,
          style: styleSheet.textTheme.fs14Normal,
        ),
      ),
    );
  }
}
