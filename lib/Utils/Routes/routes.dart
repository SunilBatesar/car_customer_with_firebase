import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Views/Account/General/Address/add_new_address_screen.dart';
import 'package:car_booking_customer/Views/Account/General/Address/my_address_screen.dart';
import 'package:car_booking_customer/Views/Account/General/Language/language_screen.dart';
import 'package:car_booking_customer/Views/Account/General/notification_setting_screen.dart';
import 'package:car_booking_customer/Views/Account/General/profile_screen.dart';
import 'package:car_booking_customer/Views/Account/General/transaction_screen.dart';
import 'package:car_booking_customer/Views/Account/Settings%20&%20Privacy/Help%20Service/Help_and_Support_screen.dart';
import 'package:car_booking_customer/Views/Account/Settings%20&%20Privacy/Help%20Service/customer_screen.dart';
import 'package:car_booking_customer/Views/Account/Settings%20&%20Privacy/Help%20Service/deleteaccount_screen.dart';
import 'package:car_booking_customer/Views/Account/Settings%20&%20Privacy/Payment%20Method/addbank_card_screen.dart';
import 'package:car_booking_customer/Views/Account/Settings%20&%20Privacy/Payment%20Method/payment_method_screen.dart';
import 'package:car_booking_customer/Views/Account/Settings%20&%20Privacy/faq_screen.dart';
import 'package:car_booking_customer/Views/Account/Settings%20&%20Privacy/privacy_policy_screen.dart';
import 'package:car_booking_customer/Views/Account/Settings%20&%20Privacy/terms_condition_screen.dart';
import 'package:car_booking_customer/Views/Authentication/Register/address_detail.dart';
import 'package:car_booking_customer/Views/Authentication/Register/kyc_detail.dart';
import 'package:car_booking_customer/Views/Authentication/Register/personal_detail.dart';
import 'package:car_booking_customer/Views/Authentication/create_new_password_screen.dart';
import 'package:car_booking_customer/Views/Authentication/forgot_password_screen.dart';
import 'package:car_booking_customer/Views/Authentication/login_screen.dart';
import 'package:car_booking_customer/Views/Authentication/verification_screen.dart';
import 'package:car_booking_customer/Views/Booking/booking_details_screen.dart';
import 'package:car_booking_customer/Views/Booking/booking_screen.dart';
import 'package:car_booking_customer/Views/BottomNavigationBar/bottom_navigationbar.dart';
import 'package:car_booking_customer/Views/Home/all_cars_view_screen.dart';
import 'package:car_booking_customer/Views/Home/all_reviews_screen.dart';
import 'package:car_booking_customer/Views/Home/home_screen.dart';
import 'package:car_booking_customer/Views/Home/notification_screen.dart';
import 'package:car_booking_customer/Views/OnBoarding/splash.dart';
import 'package:car_booking_customer/Views/Payment%20and%20Address/wish_list_screen.dart';
import 'package:car_booking_customer/Views/Vehicle%20Boooking/find_my_car.dart';
import 'package:get/get.dart';

final List<GetPage<dynamic>> appRoutes = [
  GetPage(name: RoutesName.splashScreen, page: () => SplashScreen()),
  // AUTH GETPAGE
  GetPage(name: RoutesName.loginScreen, page: () => LoginScreen()),
  GetPage(name: RoutesName.forgetScreen, page: () => ForgetScreen()),
  GetPage(
      name: RoutesName.verificationScreen, page: () => VerificationScreen()),
  GetPage(
      name: RoutesName.createNewPasswordScreen,
      page: () => CreateNewPasswordScreen()),

  // HOME GETPAGE
  GetPage(name: RoutesName.homeScreen, page: () => const HomeScreen()),
  GetPage(
      name: RoutesName.notificationScreen, page: () => NotificationScreen()),
  GetPage(
      name: RoutesName.allReviewsScreen, page: () => const AllReviewsScreen()),

  // CAR PREVIEW GETPAGE
  // GetPage(
  //     name: RoutesName.carPreviewScreen, page: () => const CarPreviewScreen()),

  // BOOKING GETPAGE
  GetPage(name: RoutesName.bookingScreen, page: () => BookingScreen()),
  GetPage(
      name: RoutesName.bookingDetailsScreen,
      page: () =>  BookingDetailsScreen()),

  // Payment and Address GETPAGE
  GetPage(name: RoutesName.wishListScreen, page: () => WishListScreen()),

  // Vehicle Boooking GETPAGE
  GetPage(name: RoutesName.findcarsScreen, page: () => FindcarsScreen()),

  //
  GetPage(name: RoutesName.bottombarScreen, page: () => BottomBarScreen()),
  GetPage(
      name: RoutesName.personalDetailScreen,
      page: () => PersonalDetailScreen()),
  GetPage(
      name: RoutesName.addressDetailScreen,
      page: () => const AddressDetailScreen()),
  GetPage(
      name: RoutesName.kyclDetailScreen, page: () => const KyclDetailScreen()),

  // Account Section Routes
  GetPage(name: RoutesName.profile, page: () => ProfileScreen()),
  GetPage(
      name: RoutesName.notificationSettingScreen,
      page: () => NotificationSettingScreen()),
  GetPage(
      name: RoutesName.paymentMethodScreen, page: () => PaymentMethodScreen()),
  GetPage(name: RoutesName.addBankCardScreen, page: () => AddBankCardScreen()),
  GetPage(
      name: RoutesName.privacyAndPolicyScreen,
      page: () => PrivacyAndPolicyScreen()),
  GetPage(
      name: RoutesName.termsAndConditionScreen,
      page: () => TermsAndConditionScreen()),
  GetPage(name: RoutesName.transactionScreen, page: () => TransactionScreen()),
  GetPage(name: RoutesName.faqScreen, page: () => FaqScreen()),
  // Address
  GetPage(name: RoutesName.myAddressScreen, page: () => MyAddressScreen()),
  GetPage(
      name: RoutesName.addNewAddressScreen, page: () => AddNewAddressScreen()),
  // Language
  GetPage(name: RoutesName.languageScreen, page: () => LanguageScreen()),
  // Help And Supports
  GetPage(
      name: RoutesName.helpAndSupportsScreen,
      page: () => HelpAndSupportsScreen()),
  GetPage(
      name: RoutesName.deleteaccountScreen, page: () => DeleteaccountScreen()),
  GetPage(
      name: RoutesName.customerServicesScreen,
      page: () => CustomerServicesScreen()),

  // All Cars View Screen Routes
  GetPage(name: RoutesName.allCarsViewScreen, page: () => AllCarsViewScreen()),
];
