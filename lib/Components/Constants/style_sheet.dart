import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors();
  Color bgclr = const Color(0xffF1EDED);
  Color primary = const Color(0xff030218);
  Color black = const Color(0xff000000);
  Color white = const Color(0xffFFFFFF);
  Color lightwhite = const Color(0xffF1EDED);
  Color gray = const Color(0xff5D5D5D);
  Color lightgray = const Color(0xffD9D9D9);
  Color darkgray = const Color(0xffB3B3BA);
  Color green = const Color(0xff1C9D07);
  Color darkgreen = const Color(0xff07AC04);
  Color lightgreen = const Color(0xffB6D400);
  Color yellow = const Color(0xffFFD600);
  Color lightyellow = const Color(0xffFFDB1B);
  Color blue = const Color(0xff0057FF);
  Color red = const Color(0xffFF0000);
  Color red70 = const Color(0xffFF0000).withOpacity(0.7);
}

class AppTextTheme {
  AppTextTheme();
  TextStyle fs14NormalPacifico =
      GoogleFonts.pacifico(fontSize: 14.sp, fontWeight: FontWeight.w400);

  // NORMAL
  TextStyle fs10Normal =
      GoogleFonts.outfit(fontSize: 10.sp, fontWeight: FontWeight.w400);
  TextStyle fs12Normal =
      GoogleFonts.outfit(fontSize: 12.sp, fontWeight: FontWeight.w400);
  TextStyle fs14Normal =
      GoogleFonts.outfit(fontSize: 14.sp, fontWeight: FontWeight.w400);
  TextStyle fs16Normal =
      GoogleFonts.outfit(fontSize: 16.sp, fontWeight: FontWeight.w400);
  TextStyle fs18Normal =
      GoogleFonts.outfit(fontSize: 18.sp, fontWeight: FontWeight.w400);
  TextStyle fs20Normal =
      GoogleFonts.outfit(fontSize: 20.sp, fontWeight: FontWeight.w400);
  TextStyle fs24Normal =
      GoogleFonts.outfit(fontSize: 24.sp, fontWeight: FontWeight.w400);
  TextStyle fs26Normal =
      GoogleFonts.outfit(fontSize: 26.sp, fontWeight: FontWeight.w400);
  TextStyle fs28Normal =
      GoogleFonts.outfit(fontSize: 28.sp, fontWeight: FontWeight.w400);
  TextStyle fs34Normal =
      GoogleFonts.outfit(fontSize: 34.sp, fontWeight: FontWeight.w400);

  // MEDIUM
  TextStyle fs18Medium =
      GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w500);
  TextStyle fs20Medium =
      GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w500);
  TextStyle fs24Medium =
      GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w500);
  TextStyle fs29Medium =
      GoogleFonts.poppins(fontSize: 29.sp, fontWeight: FontWeight.w500);

  //bold
  TextStyle fs14bold =
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w700);
  // BOLD
  TextStyle fs14Bold =
      GoogleFonts.outfit(fontSize: 14.sp, fontWeight: FontWeight.w700);
  TextStyle fs16Bold =
      GoogleFonts.outfit(fontSize: 16.sp, fontWeight: FontWeight.w700);
  TextStyle fs18Bold =
      GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w700);
  TextStyle fs24Bold =
      GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w700);
}
