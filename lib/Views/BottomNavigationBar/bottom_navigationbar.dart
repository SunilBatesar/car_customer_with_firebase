import 'package:car_booking_customer/Components/Dialogs/exit_dialog.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/Utils/Routes/routes_name.dart';
import 'package:car_booking_customer/Views/Account/account_screen.dart';
import 'package:car_booking_customer/Views/Booking/booking_screen.dart';
import 'package:car_booking_customer/Views/Home/home_screen.dart';
import 'package:car_booking_customer/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

class BottomBarScreen extends StatefulWidget {
  int currentIndex;
  BottomBarScreen({
    this.currentIndex = 0,
    super.key,
  });

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen>
    with TickerProviderStateMixin {
  // TabController? _tabController;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();

    _motionTabBarController = MotionTabBarController(
      initialIndex: widget.currentIndex,
      length: 3,
      vsync: this,
    );
  }

  List<Widget> screenList = [
    const HomeScreen(),
    BookingScreen(),
    const AccountScreen(),
  ];

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  List<String> label = [
    LanguageConst.home.tr,
    LanguageConst.bookings.tr,
    LanguageConst.account.tr
  ];

  Future<bool> _onwillpop() async {
    if (widget.currentIndex != 0) {
      Get.offAllNamed(RoutesName.bottombarScreen);
      // setState(() {
      //   widget.currentIndex = 0;
      // });
      return false;
    } else {
      Get.dialog(ExitDialog());
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onwillpop,
      child: Scaffold(
          bottomNavigationBar: MotionTabBar(
            controller:
                _motionTabBarController, // Add this controller if you need to change your tab programmatically
            initialSelectedTab: label[widget.currentIndex],
            useSafeArea: true, // default: true, apply safe area wrapper
            labels: label,

            icons: const [
              Icons.home,
              Icons.bookmark,
              Icons.person,
            ],

            // optional badges, length must be same with labels

            tabSize: 50,
            tabBarHeight: 55,
            textStyle: TextStyle(
              fontSize: 12,
              color: styleSheet.colors.primary,
              fontWeight: FontWeight.w600,
            ),
            tabIconColor: styleSheet.colors.primary,
            tabIconSize: 28.0,
            tabIconSelectedSize: 26.0,
            // tabSelectedColor: Colors.blue[900],
            tabSelectedColor: styleSheet.colors.lightgreen,
            tabIconSelectedColor: styleSheet.colors.primary,
            tabBarColor: styleSheet.colors.white,
            onTabItemSelected: (int value) {
              setState(() {
                widget.currentIndex = value;
              });
            },
          ),
          body: screenList[widget.currentIndex]),
    );
  }
}




// class BottomBarScreen extends StatefulWidget {
//   const BottomBarScreen({super.key});

//   @override
//   State<BottomBarScreen> createState() => _BottomBarScreenState();
// }

// class _BottomBarScreenState extends State<BottomBarScreen> {
//   final List<Widget> _navigationitem = [
//     const HomeScreen(),
//     const WishListScreen(),
//     const AccountScreen(),
//   ];
//   int currentIndex = 0;
//   final bottomNavigationBarcontroller = NotchBottomBarController();
//   @override
//   Widget build(BuildContext context) {
//     // code
//     return Scaffold(
//       bottomNavigationBar: AnimatedNotchBottomBar(
//           notchBottomBarController: bottomNavigationBarcontroller,
//           itemLabelStyle: styleSheet.textTheme.fs14Normal
//               .copyWith(color: styleSheet.colors.green),
//           showLabel: true,
//           color: styleSheet.colors.black,
//           notchColor: Colors.transparent,
//           shadowElevation: 0,
//           elevation: 0,
//           showShadow: false,
//           textAlign: TextAlign.center,
//           bottomBarItems: [
//             BottomBarItem(
//                 inActiveItem: Icon(
//                   Icons.home,
//                   color: styleSheet.colors.white,
//                 ),
//                 activeItem: const Icon(Icons.home),
//                 itemLabel: "Home"),
//             BottomBarItem(
//                 inActiveItem: Icon(
//                   Icons.bookmark,
//                   color: styleSheet.colors.white,
//                 ),
//                 activeItem: const Icon(
//                   Icons.bookmark,
//                 ),
//                 itemLabel: "Bookings"),
//             BottomBarItem(
//               inActiveItem: Icon(
//                 Icons.person,
//                 color: styleSheet.colors.white,
//               ),
//               activeItem: const Icon(
//                 Icons.person,
//               ),
//               itemLabel: "Account",
//             ),
//           ],
//           onTap: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//           kIconSize: 24.0.sp,
//           kBottomRadius: 5.r),
//       body: _navigationitem[currentIndex],
//     );
//   }
// }
