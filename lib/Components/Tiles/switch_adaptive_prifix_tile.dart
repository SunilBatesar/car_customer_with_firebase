import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchAdaptivePrifixTile extends StatefulWidget {
  final String title;

  const SwitchAdaptivePrifixTile({super.key, required this.title});

  @override
  State<SwitchAdaptivePrifixTile> createState() =>
      _SwitchAdaptivePrifixTileState();
}

class _SwitchAdaptivePrifixTileState extends State<SwitchAdaptivePrifixTile> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      tileColor: styleSheet.colors.white,
      title: Text(
        widget.title,
        style: styleSheet.textTheme.fs16Normal,
      ),
      trailing: Switch.adaptive(
        thumbColor: WidgetStateProperty.all(Colors.white),
        activeTrackColor: styleSheet.colors.black,
        inactiveTrackColor: styleSheet.colors.gray,
        value: _value,
        onChanged: (newValue) => setState(() => _value = newValue),
      ),
    );
  }
}
