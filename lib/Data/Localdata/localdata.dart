import 'package:car_booking_customer/Models/all_models.dart';
import 'package:car_booking_customer/Res/i18n/language_translations.dart';
import 'package:car_booking_customer/main.dart';

class Localdata {
  static List<Map<String, dynamic>> weddingDealsDataList = [
    {
      "image": styleSheet.images.weddingBoyGirl,
      "rupess": "₹1200",
      "discount": " ( 10 % Discount added )",
      "subtitle": "get  High Discounts on wedding car’s + Decoration",
      "title": "Wedding Deals"
    },
    {
      "image": styleSheet.images.weddingBoyGirl,
      "rupess": "₹1200",
      "discount": " ( 10 % Discount added )",
      "subtitle": "get  High Discounts on wedding car’s + Decoration",
      "title": "Wedding Deals"
    },
    {
      "image": styleSheet.images.weddingBoyGirl,
      "rupess": "₹1200",
      "discount": " ( 10 % Discount added )",
      "subtitle": "get  High Discounts on wedding car’s + Decoration",
      "title": "Wedding Deals"
    },
  ];

  static List<Map<String, dynamic>> vehicleDataFilter = [
    {
      "Category": [
        "SUV",
        "Sports",
        "Coupe",
        "Sedan",
        "Scorpio",
        "Casual",
        "Vintage"
      ],
    },
    {
      "Price Rate": ["Per Hourly", "Per Day", "Per Kilometer"],
    },
    {
      "Fuel": ["Petrol", "Diesel", "Gas"],
    },
    {
      "Transmission": ["Automatic", "Manual"],
    },
    {
      "Seating": ["2", "4", "6", "8"],
    },
  ];

// Data for Account Section

  static List<AccountModel> generalData = [
    AccountModel(
        id: "profile",
        title: LanguageConst.profile,
        icon: styleSheet.icons.profileIcon),
    AccountModel(
        id: "myAddress",
        title: LanguageConst.myAddress,
        icon: styleSheet.icons.location2),
    AccountModel(
        id: "wishlist",
        title: LanguageConst.wishList,
        icon: styleSheet.icons.black_heart),
    AccountModel(
        id: "myBookings",
        title: LanguageConst.myB,
        icon: styleSheet.icons.bookingIcon),
    AccountModel(
        id: "language",
        title: LanguageConst.language,
        icon: styleSheet.icons.language),
    AccountModel(
        id: "myTransactions",
        title: LanguageConst.myTransactions,
        icon: styleSheet.icons.transactionIcon),
    AccountModel(
        id: "notifications",
        title: LanguageConst.notifications,
        icon: styleSheet.icons.notificationIcon),
  ];

  static List<AccountModel> settingsData = [
    AccountModel(
        id: "Payment",
        title: LanguageConst.paymentMethods,
        icon: styleSheet.icons.wallet),
    AccountModel(
        id: "Privacy",
        title: LanguageConst.privacyPolicy,
        icon: styleSheet.icons.privacyIcon),
    AccountModel(
        id: "Term’s",
        title: LanguageConst.termsAndCondition,
        icon: styleSheet.icons.termsIcon),
    AccountModel(
        id: "FAQ’s", title: LanguageConst.faqs, icon: styleSheet.icons.fAQ),
    AccountModel(
        id: "Help",
        title: LanguageConst.helpAndSupport,
        icon: styleSheet.icons.helpandSupport),
    AccountModel(
        id: "Rate", title: LanguageConst.rateUs, icon: styleSheet.icons.rateUs),
    AccountModel(
        id: "Logout",
        title: LanguageConst.logout,
        icon: styleSheet.icons.logoutIcon),
  ];
  static List<Map<String, dynamic>> offerList = [
    {"title": "10% off on your first booking :", "subtitle": " FIRST10"},
    {"title": "20% off on your first booking :", "subtitle": " FIRST20"},
  ];

  static List<Map<String, dynamic>> categoriesData = [
    {
      "icon": styleSheet.icons.cash,
      "tittle": "Cash on Delivery",
      "subtitle": "% increase in charges "
    },
    {
      "icon": styleSheet.icons.visa,
      "tittle": "   4522",
      "subtitle": "Expires on 12/02/25 "
    },
    {
      "icon": styleSheet.icons.upi,
      "tittle": "UPI",
      "subtitle": "add your UIP ID"
    },
    {
      "icon": styleSheet.icons.paytm,
      "tittle": "Paytm",
      "subtitle": "add your mobile no"
    },
    {
      "icon": styleSheet.icons.expire,
      "tittle": "   4522",
      "subtitle": "Expires on 19/06/26"
    },
  ];
  static List<HelpandSupportModel> helpandSupportData = [
    HelpandSupportModel(
        id: "CustomerServices",
        title: LanguageConst.customerServices,
        prefixicon: styleSheet.icons.headphone),
    HelpandSupportModel(
        id: "Whatsapp",
        title: LanguageConst.whatsApp,
        prefixicon: styleSheet.icons.Whatsapp),
    HelpandSupportModel(
        id: "DeleteAccount",
        title: LanguageConst.deleteMyAccount,
        prefixicon: styleSheet.icons.delete),
    HelpandSupportModel(
        id: "Toll Free Number",
        title: LanguageConst.tollFreeNumber,
        prefixicon: styleSheet.icons.tollfree),
  ];
  static List<DeleteAccountModel> deleteAccountData = [
    DeleteAccountModel(title: LanguageConst.noLUTSP),
    DeleteAccountModel(title: LanguageConst.foundBA),
    DeleteAccountModel(title: LanguageConst.tooMEN),
    DeleteAccountModel(title: LanguageConst.difficultNIP),
    DeleteAccountModel(title: LanguageConst.accountSC),
    DeleteAccountModel(title: LanguageConst.personalReason),
    DeleteAccountModel(title: LanguageConst.other),
  ];
}
