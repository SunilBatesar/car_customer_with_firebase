import 'package:car_booking_customer/Components/Constants/app_images.dart';
import 'package:car_booking_customer/Components/Constants/style_sheet.dart';
import 'package:car_booking_customer/Res/Services/app_services.dart';

class ConstantSheet {
  ConstantSheet._constructor();
  static final ConstantSheet instance = ConstantSheet._constructor();

  factory ConstantSheet() {
    return instance;
  }

// Check now
  //  APP TEXT THEME GET
  AppTextTheme get textTheme => AppTextTheme();

  //  APP COLORS GET
  final _appColors = AppColors();
  AppColors get colors => _appColors;

  //  APP SERVICES GET
  final _appServices = AppServices();
  AppServices get services => _appServices;

  //  APP Images GET
  final _appimages = AppImage();
  AppImage get images => _appimages;

  //  APP Images GET
  final _appIcons = AppIcons();
  AppIcons get icons => _appIcons;
}
