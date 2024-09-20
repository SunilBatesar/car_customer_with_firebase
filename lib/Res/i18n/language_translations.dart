import 'package:car_booking_customer/Models/language_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageTranslations extends Translations {
  // LANGUAGE CODE AND COUNTRY CODE SET
  static LanguageModel englishUS = LanguageModel(
      languageName: "English", languageCode: "en", countryCode: "US");
  static LanguageModel hindi = LanguageModel(
      languageName: "Hindi", languageCode: "hi", countryCode: "IN");

  @override
  Map<String, Map<String, String>> get keys => {
        englishUS.toString(): LanguageType.english,
        hindi.toString(): LanguageType.hindi,
      };

  //  VARIABLE LOCALE LANGUAGE
  static Locale locale = Locale(englishUS.languageCode, englishUS.countryCode);
  // LANGUAGE LIST
  static final List<LanguageModel> languageList = [englishUS, hindi];
}

// LANGUAGE TYPE CLASS
class LanguageType {
  // LANGUAGE ENGLISH
  static final Map<String, String> english = {
    // EXIT Dialog ENGLISH LANGUAGE START ----->
    LanguageConst.areYSYWT: "Are you sure you want to",
    LanguageConst.exit: "Exit",
    // EXIT Dialog ENGLISH LANGUAGE END ----->

    // EXIT Dialog ENGLISH LANGUAGE START ----->
    LanguageConst.setting: "Setting",

    // Image Pick ENGLISH LANGUAGE START ----->
    LanguageConst.profilePhoto: "Profile Photo",
    LanguageConst.gallery: "Gallery",
    LanguageConst.camera: "Camera",
    // Image Pick ENGLISH LANGUAGE END ----->

    // AUTHENTICATION ENGLISH LANGUAGE START ----->
    // LOGIN
    LanguageConst.welcome: "Welcome",
    LanguageConst.gladTSy: "Glad to See you",
    LanguageConst.userE: "User Email",
    LanguageConst.enterUE: "Enter user email",
    LanguageConst.password: "Password",
    LanguageConst.enterP: "Enter password",
    LanguageConst.login: "Login",
    LanguageConst.forgotP: "Forgot Password ?",
    LanguageConst.or: "or",
    LanguageConst.newTRRn: "New to CC Rental ! Register Now ?",
    // REGISTER FORM
    LanguageConst.personalD: "Personal Details",
    LanguageConst.pleaseFaRdfR:
        "Please fill all required details for Registration",
    LanguageConst.name: "Name",
    LanguageConst.enterN: "Enter name",
    LanguageConst.phoneN: "Phone no",
    LanguageConst.enterYpn: "Enter your phone no",
    LanguageConst.email: "Email",
    LanguageConst.enterYe: "Enter your email",
    LanguageConst.next: "Next",
    // REGISTER ADDRESS
    LanguageConst.addressD: "Address Details",
    LanguageConst.pleaseFaanaD:
        "Please fill your address and all necessary details",
    LanguageConst.title: "Title",
    LanguageConst.enterTfyA: "enter title for your address",
    LanguageConst.streetA: "Street Address",
    LanguageConst.fillYsa: "fill your street address",
    LanguageConst.city: "City",
    LanguageConst.select: "select",
    LanguageConst.state: "State",
    LanguageConst.country: "Country",
    LanguageConst.postalC: "Postal code",
    LanguageConst.enterField: "enter",
    // REGISTER KYC
    LanguageConst.kycD: "KYC Details",
    LanguageConst.skip: "Skip",
    LanguageConst.documentT: "Document Type",
    LanguageConst.selectYdt: "select your document type",
    LanguageConst.documentN: "Document number",
    LanguageConst.fillYpdn: "fill your provided document no",
    LanguageConst.documentED: "Document Expiry Date",
    LanguageConst.uploadDocument: "Upload Document",
    LanguageConst.uploadDmax50mb: "Upload Document  ( max 50mb ) ",
    LanguageConst.browse: "Browse ?",
    LanguageConst.save: "Save",
    LanguageConst.saveChanges: "Save Changes",
    // REGISTER POPUP
    LanguageConst.accountCS: "Account Created Sucessfully",
    LanguageConst.pleaseWwtaytlp:
        "Please wait  we are taking you to login page ",
    // FORGOT PASSWORD
    LanguageConst.forgotPassword: "Forgot Password",
    LanguageConst.pleaseEyemoWcsytvc:
        "Please enter your email or mobile number so we can sent you the verification code to your filled address ",
    LanguageConst.emailOrMobile: "Email or mobile ",
    LanguageConst.enterUEOM: "enter user Email or mobile ",
    LanguageConst.continueText: "Continue",
    LanguageConst.backToLogin: "Back to Login",
    // FORGOT VERIFICATION
    LanguageConst.verificationS: "Verification Step",
    LanguageConst.weHsavcoD: "We have sent a verification code on your device.",
    LanguageConst.secL: "sec left",
    LanguageConst.resendOTP: "Resend OTP ?",
    LanguageConst.verify: "Verify",
    // FORGOT NEW PASSWORD
    LanguageConst.createNp: "Create new password",
    LanguageConst.pleaseEynpfyas:
        "Please enter your new password for your acccont security",
    LanguageConst.newP: "New password",
    LanguageConst.confirmP: "Confirm password",
    // FORGOT POPUP
    LanguageConst.passwordCS: "Password Changed Successfully",
    // AUTHENTICATION ENGLISH LANGUAGE  END ----->

    // HOME ENGLISH LANGUAGE  START ----->
    // HOME POPUP
    LanguageConst.allowCRTATDL:
        "Allow CC Rental to Access this Device Location",
    LanguageConst.tastIMSLSWTTPA:
        "This App state that it may share location data with third parties app",
    LanguageConst.precise: "Precise",
    LanguageConst.approximate: "Approximate",
    LanguageConst.whileUTA: "While Using the app",
    LanguageConst.onlyTT: "Only this time",
    LanguageConst.dontA: "Don’t Allow",
    // HOME SCREEN
    LanguageConst.searchFRAC: "Search for rental & cars",
    LanguageConst.topRC: "Top Rental Car’s",
    LanguageConst.viewA: "View all",
    LanguageConst.petrol: "Petrol",
    LanguageConst.auto: "Auto",
    LanguageConst.seats: "Seats",
    LanguageConst.seeD: "See details",
    LanguageConst.myB: "My Bookings",
    LanguageConst.seeA: "See all",
    LanguageConst.bookingID: "Booking ID",
    LanguageConst.day: "Day",
    LanguageConst.findYCAP: "Find your Car at Affordable Price",
    LanguageConst.findMC: "Find My Car",
    LanguageConst.reviews: "Reviews",
    LanguageConst.hrA: "hr ago",
    // BOTTOM NAVIGATION BAR TEXT
    LanguageConst.home: "Home",
    LanguageConst.bookings: "Bookings",
    LanguageConst.account: "Account",
    // NOTIFICATIONS SCREEN
    LanguageConst.notifications: "Notifications",
    LanguageConst.searchFM: "Search for messages",
    LanguageConst.booking: "Booking",
    // HOME ENGLISH LANGUAGE  END ----->

    // VEHICLE BOOKING ENGLISH LANGUAGE  START ----->
    // Filter
    LanguageConst.category: "Category",
    LanguageConst.priceRate: "Price Rate",
    LanguageConst.fuel: "Fuel",
    LanguageConst.transmission: "Transmission",
    LanguageConst.seating: "Seating",
    LanguageConst.suv: "SUV",
    LanguageConst.sports: "Sports",
    LanguageConst.coupe: "Coupe",
    LanguageConst.sedan: "Sedan",
    LanguageConst.scorpio: "Scorpio",
    LanguageConst.casual: "Casual",
    LanguageConst.vintage: "Vintage",
    // Price rate
    LanguageConst.perHourly: "Per Hourly",
    LanguageConst.perDay: "Per Day",
    LanguageConst.perKilometer: "Per Kilometer",
    // Fuel
    LanguageConst.gas: "Gas",
    LanguageConst.diesel: "Diesel",
    // Transmission
    LanguageConst.automatic: "Automatic",
    LanguageConst.manual: "Manual",
    // Find Car
    LanguageConst.searchFRC: "Search for rental & cars",
    LanguageConst.carATWL: "Car added to Wish list",
    // Car Perview
    LanguageConst.available: "Available",
    LanguageConst.review: "review",
    LanguageConst.priceR: "Price Rate (₹)",
    LanguageConst.introduction: "Introduction",
    LanguageConst.carDetails: "Car Details",
    LanguageConst.carMake: "Car Make",
    LanguageConst.color: "Color",
    LanguageConst.licensePlateNo: "License Plate no",
    LanguageConst.seatingCapacity: "Seating Capacity",
    LanguageConst.similarVehicles: "Similar Vehicles",
    LanguageConst.rentNow: "Rent Now",
    // Car image and video
    LanguageConst.photos: "Photots",
    LanguageConst.videos: "Videos",
    // VEHICLE BOOKING ENGLISH LANGUAGE  END ----->

    // BOOKINGS ENGLISH LANGUAGE  START ----->
    // Bookings
    LanguageConst.searchForBookings: "Search for Bookings",
    LanguageConst.upcoming: "Upcoming",
    LanguageConst.completed: "Completed",
    // Booking detail
    LanguageConst.bookingDetails: "Booking Details",
    LanguageConst.off: "off",
    LanguageConst.address: "Address",
    LanguageConst.destination: "Destination",
    LanguageConst.timeAndDate: "Time & Date",
    LanguageConst.amount: "Amount",
    LanguageConst.modeOfPayment: "Mode of Payment",
    LanguageConst.couponCodeApplied: "Coupon code applied",
    LanguageConst.cancel: "Cancel",
    LanguageConst.ok: "Ok",
    LanguageConst.payNow: "Pay Now",
    // Payment Sucessfull popup
    LanguageConst.transactionID: "Transaction ID",
    LanguageConst.paymentSuccessful: "Payment Sucessfull",
    LanguageConst.paymentTo: "Payment to",
    LanguageConst.changeTimeDate: "Change Time & Date",
    LanguageConst.time: "time",
    LanguageConst.date: "Date",
    LanguageConst.promoCodeApplied: "Promo code applied",
    LanguageConst.paidAmount: "Paid Amount",
    // BOOKINGS ENGLISH LANGUAGE  END ----->

    // PAYMENT AND ADDRESS LANGUAGE  START ----->
    // Wish list
    LanguageConst.wishList: "Wish list",
    LanguageConst.herAYSCFTBIWASTWLSYCBLE:
        "here are your selected car for the booking , it will auto save to wish list so you can bok later easily",
    LanguageConst.car: "Car",
    LanguageConst.payment: "Payment",
    LanguageConst.totalAmount: "Total Amount",
    // Add Address
    LanguageConst.addAddress: "Add Address",
    LanguageConst.fillOrSelectLocation:
        "fill or select your location and Destination for the the Booking",
    LanguageConst.addressDefault: "Address( default )",
    LanguageConst.choseyourDestination: "Chose your Destination",
    LanguageConst.totalKilometers: "Total Kilometer’s",
    LanguageConst.kilometers: " Kilometer’s",
    LanguageConst.perKm: "per km",
    // Payment
    LanguageConst.hereIYBRFASV:
        "Here is your Booking Review for all Selected Vehicles",
    LanguageConst.setTimeAndDate: "Set Time & Date",
    LanguageConst.cash: "Cash",
    LanguageConst.online: "Online",
    LanguageConst.saveMoreOnBooking: "Save more on your booking",
    LanguageConst.apply: "Apply",
    LanguageConst.applied: "Applied",
    LanguageConst.taxPercentGST: "Tax % ( GST )",
    LanguageConst.couponDiscount: "Coupon Discount",
    // Date and Time Popup
    LanguageConst.setTime: "Set Time",
    LanguageConst.setDate: "Set Date",
    LanguageConst.reset: "Reset",
    // PAYMENT AND ADDRESS LANGUAGE  END ----->

    // ACCOUNT LANGUAGE  START ----->
    // Account
    LanguageConst.availableBalance: "Available Balance",
    LanguageConst.general: "General",
    LanguageConst.profile: "Profile",
    LanguageConst.myAddress: "My Address",
    LanguageConst.language: "Language",
    LanguageConst.myTransactions: "My Transactions",
    LanguageConst.settingsAndPrivacy: "Settings & Privacy",
    LanguageConst.paymentMethods: "Payment Methods",
    LanguageConst.privacyPolicy: "Privacy Policy",
    LanguageConst.termsAndCondition: "Term’s and  Condition",
    LanguageConst.faqs: "FAQ’s",
    LanguageConst.helpAndSupport: "Help & Support",
    LanguageConst.rateUs: "Rate Us",
    LanguageConst.logout: "Logout",
    // Profile
    LanguageConst.pleaseCAAYNDFYBP:
        "Please check and add your necessary details for your booking Profile",
    LanguageConst.enterYourName: "enter your name",
    LanguageConst.mobile: "Mobile",
    LanguageConst.location: "Location",
    // Language
    LanguageConst.searchForLanguages: "Search for languages",
    // Transaction
    LanguageConst.transaction: "Transaction",
    LanguageConst.searchForTransactions: "Search for Transactions",
    // My Address
    LanguageConst.yourSavedAddresses: "Your Saved Addresses",
    // Add New Address
    LanguageConst.addNewAddress: "Add New Address",
    LanguageConst.searchFASA: "Search for available service area",
    LanguageConst.houseNoBuildingName: "House No. / Building Name",
    LanguageConst.enterHouseNo: "Enter House No.",
    LanguageConst.addressTitle: "Address Tittle",
    LanguageConst.contactName: "Contact Name",
    LanguageConst.contactNumber: "Contact Number",
    // FAQ’s
    LanguageConst.stillNeedHelpContactUs: "Still need Help ! Contact Us",
    LanguageConst.q: "Q",
    LanguageConst.a: "Ans",
    // Payment Methods
    LanguageConst.currentMethod: "Current Method",
    LanguageConst.defaultMethod: "Default Method",
    LanguageConst.choosYDPMFOPIWYACOAYC:
        "Chose your desired payment method for online payments in which you are comfortable or add your cards",
    LanguageConst.cashOnDelivery: "Cash on Delivery",
    LanguageConst.increaseInCharges: "increase in charges",
    LanguageConst.expiresOn: "Expires on",
    LanguageConst.upi: "UPI",
    LanguageConst.addYourUPIID: "add your UIP ID",
    LanguageConst.enterYourUPIID: "Enter your UPI ID",
    LanguageConst.paytm: "Paytm",
    LanguageConst.addYourMobileNo: "add your mobile no",
    // Add card
    LanguageConst.addCard: "Add  Card",
    LanguageConst.addBankCard: "Add Bank Card",
    LanguageConst.addNewCard: "Add new card",
    LanguageConst.streamlineCheckoutProcess:
        "Streamline your checkout process by adding a new card for future transactions. Your card information is secured with advanced encryption technology.",
    LanguageConst.cardNo: "Card no",
    LanguageConst.expiryDate: "Expiry Date",
    LanguageConst.cvv: "CVV",
    LanguageConst.mmyy: "MM/YY",
    LanguageConst.cardholdersName: "Cardholder’s name",
    LanguageConst.enterCardholdersFullName: "enter cardholder’s full name",
    LanguageConst.addMycard: "Add My card",
    // Bank Popup
    LanguageConst.bankCardAddedSuccessfully: "Bank Card Added Successfully",
    LanguageConst.pleaseWaitForDetails:
        "please wait we are taking up Required detials",
    // Notification
    LanguageConst.notificationSetting: "Notification Setting",
    LanguageConst.inAppNotification: "In App Notifcation",
    LanguageConst.getInAppNotification: "Get Notification Within App",
    LanguageConst.systemNotification: "System Notification",
    LanguageConst.getSystemNotification: "Get Notification outside the App",
    LanguageConst.behaviour: "Behaviour",
    LanguageConst.allowNTWTD: "Allow Notification to wake the Device",
    LanguageConst.disableNV: "Disable Notification Vibration",
    LanguageConst.doNotDisturb: "Do Not Disctrub",
    // Help & Support
    LanguageConst.youCCOEASFYCAH:
        "You can connect our experts and support for your conformations and Hleps",
    LanguageConst.customerServices: "Customer Services",
    LanguageConst.whatsApp: "WhatsApp",
    LanguageConst.deleteMyAccount: "Delete My Account",
    LanguageConst.tollFreeNumber: "Toll Free Number",
    // Customer Service
    LanguageConst.customerService: "Customer Service",
    LanguageConst.message: "Message",
    // Delete Account
    LanguageConst.deleteAccount: "Delete Account",
    LanguageConst.ifYWTDAYAPTPRFDA:
        "If you want to delete Account you are prompted to provide reason for deleting account ",
    LanguageConst.noLUTSP: "No Longer Uses the Service Platform",
    LanguageConst.foundBA: "Found a better alternative",
    LanguageConst.tooMEN: "Too many email / notification",
    LanguageConst.difficultNIP: "Difficult Navigation in Platform",
    LanguageConst.accountSC: "Account Security Concerns",
    LanguageConst.personalReason: "Personal Reason ",
    LanguageConst.other: "Other",
    LanguageConst.typeHere: "type here",
    // Delete Account Popup
    LanguageConst.areYouSure: "Are you Sure ?",
    LanguageConst.youWTDYAP: "You Want to Delete your Account Permanently",
    LanguageConst.ensuringTTUUCTDTALD:
        "Ensuring that the user understands consequences to deleting their Account ( loss of Data )",
    LanguageConst.keepAccount: "Keep Account",
    // Rate us Popup
    LanguageConst.letsKWYLAWWCGBREATYRB:
        "Let’s Know what you like and where we can get Better. Rat eus adn type your Responses Below.",
    LanguageConst.rateYourExperience: "Rate your experience",
    LanguageConst.ouchPTUWWCI: "ouch ! please tell us what we can improve",
    LanguageConst.contactUs: "Contact Us",
    LanguageConst.submit: "Submit",
    // Logout Popup
    LanguageConst.areYouSureLogout: "Are you Sure you want to Logout",
    LanguageConst.no: "No",
    LanguageConst.yes: "Yes",
  };

  //  LANGUAGE HINDI
  static final Map<String, String> hindi = {
    // EXIT Dialog HINDI LANGUAGE START ----->
    LanguageConst.areYSYWT: "क्या आप सचमच करना चाहते हैं",
    LanguageConst.exit: "बाहर",

    // Setting HINDI LANGUAGE START ----->
    LanguageConst.setting: "सेटिंग",

    // EXIT Dialog HINDI LANGUAGE END ----->
    // Image Pick HINDI LANGUAGE START ----->
    LanguageConst.profilePhoto: "खाते की फोटो",
    LanguageConst.gallery: "गैलरी",
    LanguageConst.camera: "कैमरा",
    // AUTHENTICATION HINDI LANGUAGE  START ----->
    // LOGIN
    LanguageConst.welcome: "स्वागत है",
    LanguageConst.gladTSy: "आपको देख के खुशी हुई",
    LanguageConst.userE: "उपयोगकर्ता ईमेल",
    LanguageConst.enterUE: "उपयोगकर्ता ईमेल दर्ज करें",
    LanguageConst.password: "पासवर्ड",
    LanguageConst.enterP: "पासवर्ड दर्ज करें",
    LanguageConst.login: "लॉगिन करें",
    LanguageConst.forgotP: "पासवर्ड भूल गए?",
    LanguageConst.or: "या",
    LanguageConst.newTRRn: "CC रेंटल में नए हैं! अभी रजिस्टर करें?",
    // REGISTER FORM
    LanguageConst.personalD: "व्यक्तिगत विवरण",
    LanguageConst.pleaseFaRdfR: "कृपया पंजीकरण के लिए सभी आवश्यक विवरण भरें",
    LanguageConst.name: "नाम",
    LanguageConst.enterN: "नाम दर्ज करें",
    LanguageConst.phoneN: "फोन नंबर",
    LanguageConst.enterYpn: "अपना फोन नंबर दर्ज करें",
    LanguageConst.email: "ईमेल",
    LanguageConst.enterYe: "अपना ईमेल दर्ज करें",
    LanguageConst.next: "अगला",
    // REGISTER ADDRESS
    LanguageConst.addressD: "पता विवरण",
    LanguageConst.pleaseFaanaD: "कृपया अपना पता और सभी आवश्यक विवरण भरें",
    LanguageConst.title: "शीर्षक",
    LanguageConst.enterTfyA: "अपने पते के लिए शीर्षक दर्ज करें",
    LanguageConst.streetA: "सड़क का पता",
    LanguageConst.fillYsa: "अपना सड़क का पता भरें",
    LanguageConst.city: "शहर",
    LanguageConst.select: "चुनें",
    LanguageConst.state: "राज्य",
    LanguageConst.country: "देश",
    LanguageConst.postalC: "पोस्टल कोड",
    LanguageConst.enterField: "दर्ज करें",
    // REGISTER KYC
    LanguageConst.kycD: "केवाईसी विवरण",
    LanguageConst.skip: "छोड़ें",
    LanguageConst.documentT: "दस्तावेज़ प्रकार",
    LanguageConst.selectYdt: "अपना दस्तावेज़ प्रकार चुनें",
    LanguageConst.documentN: "दस्तावेज़ संख्या",
    LanguageConst.fillYpdn: "अपनी दी गई दस्तावेज़ संख्या भरें",
    LanguageConst.documentED: "दस्तावेज़ समाप्ति तिथि",
    LanguageConst.uploadDocument: "दस्तावेज़ अपलोड करें",
    LanguageConst.uploadDmax50mb: "दस्तावेज़ अपलोड करें (अधिकतम 50mb)",
    LanguageConst.browse: "ब्राउज़ करें?",
    LanguageConst.save: "सहेजें",
    LanguageConst.saveChanges: "परिवर्तनों को सुरक्षित करें",
    // REGISTER POPUP
    LanguageConst.accountCS: "खाता सफलतापूर्वक बनाया गया",
    LanguageConst.pleaseWwtaytlp:
        "कृपया प्रतीक्षा करें, हम आपको लॉगिन पेज पर ले जा रहे हैं",
    // FORGOT PASSWORD
    LanguageConst.forgotPassword: "पासवर्ड भूल गए",
    LanguageConst.pleaseEyemoWcsytvc:
        "कृपया अपना ईमेल या मोबाइल नंबर दर्ज करें ताकि हम आपको आपके भरे गए पते पर सत्यापन कोड भेज सकें",
    LanguageConst.emailOrMobile: "ईमेल या मोबाइल",
    LanguageConst.enterUEOM: "उपयोगकर्ता का ईमेल या मोबाइल दर्ज करें",
    LanguageConst.continueText: "जारी रखें",
    LanguageConst.backToLogin: "लॉगिन पर वापस जाएं",
    // FORGOT VERIFICATION
    LanguageConst.verificationS: "सत्यापन चरण",
    LanguageConst.weHsavcoD: "हमने आपके डिवाइस पर सत्यापन कोड भेजा है।",
    LanguageConst.secL: "सेकंड बाकी",
    LanguageConst.resendOTP: "ओटीपी पुनः भेजें?",
    LanguageConst.verify: "सत्यापित करें",
    // FORGOT NEW PASSWORD
    LanguageConst.createNp: "नया पासवर्ड बनाएं",
    LanguageConst.pleaseEynpfyas:
        "कृपया अपने खाते की सुरक्षा के लिए अपना नया पासवर्ड दर्ज करें",
    LanguageConst.newP: "नया पासवर्ड",
    LanguageConst.confirmP: "पासवर्ड की पुष्टि करें",
    // FORGOT POPUP
    LanguageConst.passwordCS: "पासवर्ड सफलतापूर्वक बदला गया",
    // AUTHENTICATION HINDI LANGUAGE  END ----->

    // HOME HINDI LANGUAGE  START ----->
    // HOME POPUP
    LanguageConst.allowCRTATDL:
        "CC रेंटल को इस डिवाइस का स्थान एक्सेस करने की अनुमति दें",
    LanguageConst.tastIMSLSWTTPA:
        "यह ऐप बताता है कि यह स्थान डेटा को तृतीय पक्ष ऐप के साथ साझा कर सकता है",
    LanguageConst.precise: "सटीक",
    LanguageConst.approximate: "अनुमानित",
    LanguageConst.whileUTA: "ऐप का उपयोग करते समय",
    LanguageConst.onlyTT: "केवल इस बार",
    LanguageConst.dontA: "अनुमति न दें",
    // HOME SCREEN
    LanguageConst.searchFRAC: "किराये और कारों के लिए खोजें",
    LanguageConst.topRC: "शीर्ष किराये की कारें",
    LanguageConst.viewA: "सभी देखें",
    LanguageConst.petrol: "पेट्रोल",
    LanguageConst.auto: "ऑटो",
    LanguageConst.seats: "सीटें",
    LanguageConst.seeD: "विवरण देखें",
    LanguageConst.myB: "मेरी बुकिंग",
    LanguageConst.seeA: "सभी देखें",
    LanguageConst.bookingID: "बुकिंग आईडी",
    LanguageConst.day: "दिन",
    LanguageConst.findYCAP: "सस्ती कीमत पर अपनी कार खोजें",
    LanguageConst.findMC: "मेरी कार खोजें",
    LanguageConst.reviews: "समीक्षाएं",
    LanguageConst.hrA: "घंटा पहले",
    // BOTTOM NAVIGATION BAR TEXT
    LanguageConst.home: "होम",
    LanguageConst.bookings: "बुकिंग",
    LanguageConst.account: "खाता",
    // NOTIFICATIONS SCREEN
    LanguageConst.notifications: "सूचनाएं",
    LanguageConst.searchFM: "संदेशों के लिए खोजें",
    LanguageConst.booking: "बुकिंग",
    // HOME HINDI LANGUAGE  END ----->

    // VEHICLE BOOKING HINDI LANGUAGE  START ----->
    // Filter
    LanguageConst.category: "श्रेणी",
    LanguageConst.priceRate: "मूल्य दर",
    LanguageConst.fuel: "ईंधन",
    LanguageConst.transmission: "ट्रांसमिशन",
    LanguageConst.seating: "बैठने की व्यवस्था",
    LanguageConst.suv: "एसयूवी",
    LanguageConst.sports: "खेल",
    LanguageConst.coupe: "कूपे",
    LanguageConst.sedan: "सेडान",
    LanguageConst.scorpio: "स्कॉर्पियो",
    LanguageConst.casual: "आकस्मिक",
    LanguageConst.vintage: "विंटेज",
    // Price rate
    LanguageConst.perHourly: "प्रति घंटा",
    LanguageConst.perDay: "प्रति दिन",
    LanguageConst.perKilometer: "प्रति किलोमीटर",
    // Fuel
    LanguageConst.gas: "गैस",
    LanguageConst.diesel: "डीजल",
    // Transmission
    LanguageConst.automatic: "स्वचालित",
    LanguageConst.manual: "मैनुअल",
    // Find Car
    LanguageConst.searchFRC: "किराये की कार खोजें",
    LanguageConst.carATWL: "कार को इच्छा सूची में जोड़ा गया",
    // Car Perview
    LanguageConst.available: "उपलब्ध",
    LanguageConst.review: "समीक्षा",
    LanguageConst.priceR: "मूल्य दर (₹)",
    LanguageConst.introduction: "परिचय",
    LanguageConst.carDetails: "कार विवरण",
    LanguageConst.carMake: "कार ब्रांड",
    LanguageConst.color: "रंग",
    LanguageConst.licensePlateNo: "लाइसेंस प्लेट नंबर",
    LanguageConst.seatingCapacity: "बैठने की क्षमता",
    LanguageConst.similarVehicles: "समान वाहन",
    LanguageConst.rentNow: "अभी किराए पर लें",
    // Car image and video
    LanguageConst.photos: "फोटो",
    LanguageConst.videos: "वीडियो",
    // VEHICLE BOOKING HINDI LANGUAGE  END ----->

    // BOOKINGS HINDI LANGUAGE  START ----->
    // Bookings
    LanguageConst.searchForBookings: "बुकिंग खोजें",
    LanguageConst.upcoming: "आगामी",
    LanguageConst.completed: "पूर्ण",
    // Booking detail
    LanguageConst.bookingDetails: "बुकिंग विवरण",
    LanguageConst.off: "बंद",
    LanguageConst.address: "पता",
    LanguageConst.destination: "गंतव्य",
    LanguageConst.timeAndDate: "समय और तिथि",
    LanguageConst.amount: "राशि",
    LanguageConst.modeOfPayment: "भुगतान का तरीका",
    LanguageConst.couponCodeApplied: "कूपन कोड लागू किया गया",
    LanguageConst.cancel: "रद्द करें",
    LanguageConst.ok: "ठीक है",
    LanguageConst.payNow: "अभी भुगतान करें",
    // Payment Sucessfull popup
    LanguageConst.transactionID: "लेन-देन आईडी",
    LanguageConst.paymentSuccessful: "भुगतान सफल",
    LanguageConst.paymentTo: "भुगतान को",
    LanguageConst.changeTimeDate: "समय और दिनांक बदलें",
    LanguageConst.time: "समय",
    LanguageConst.date: "तारीख",
    LanguageConst.promoCodeApplied: "प्रमो कोड लागू किया गया",
    LanguageConst.paidAmount: "भुगतान की राशि",
    // BOOKINGS HINDI LANGUAGE  END ----->

    // PAYMENT AND ADDRESS LANGUAGE  START ----->
    // Wish list
    LanguageConst.wishList: "इच्छा सूची",
    LanguageConst.herAYSCFTBIWASTWLSYCBLE:
        "यहां आपके चुने हुए वाहन हैं, यह स्वतः इच्छा सूची में सहेज लिया जाएगा ताकि आप बाद में आसानी से बुक कर सकें",
    LanguageConst.car: "कार",
    LanguageConst.payment: "भुगतान",
    LanguageConst.totalAmount: "कुल राशि",
    // Add Address
    LanguageConst.addAddress: "पता जोड़ें",
    LanguageConst.fillOrSelectLocation:
        "बुकिंग के लिए अपना स्थान और गंतव्य भरें या चुनें",
    LanguageConst.addressDefault: "पता (डिफ़ॉल्ट)",
    LanguageConst.choseyourDestination: "अपना गंतव्य चुनें",
    LanguageConst.totalKilometers: "कुल किलोमीटर",
    LanguageConst.kilometers: " किलोमीटर",
    LanguageConst.perKm: "प्रति किलोमीटर",
    // Payment
    LanguageConst.hereIYBRFASV:
        "यहां सभी चुने गए वाहनों के लिए आपकी बुकिंग समीक्षा है",
    LanguageConst.setTimeAndDate: "समय और तिथि सेट करें",
    LanguageConst.cash: "नकद",
    LanguageConst.online: "ऑनलाइन",
    LanguageConst.saveMoreOnBooking: "अपनी बुकिंग पर अधिक बचत करें",
    LanguageConst.apply: "लागू करें",
    LanguageConst.applied: "लागू किया गया",
    LanguageConst.taxPercentGST: "कर % (GST)",
    LanguageConst.couponDiscount: "कूपन छूट",
    // Date and Time Popup
    LanguageConst.setTime: "समय सेट करें",
    LanguageConst.setDate: "तिथि सेट करें",
    LanguageConst.reset: "रीसेट करें",
    // PAYMENT AND ADDRESS HINDI LANGUAGE  END ----->

    // ACCOUNT HINDI LANGUAGE START ----->
    // Account
    LanguageConst.availableBalance: "उपलब्ध शेष राशि",
    LanguageConst.general: "सामान्य",
    LanguageConst.profile: "प्रोफ़ाइल",
    LanguageConst.myAddress: "मेरा पता",
    LanguageConst.language: "भाषा",
    LanguageConst.myTransactions: "मेरे लेन-देन",
    LanguageConst.settingsAndPrivacy: "सेटिंग्स और गोपनीयता",
    LanguageConst.paymentMethods: "भुगतान के तरीके",
    LanguageConst.privacyPolicy: "गोपनीयता नीति",
    LanguageConst.termsAndCondition: "नियम और शर्तें",
    LanguageConst.faqs: "सामान्य प्रश्न",
    LanguageConst.helpAndSupport: "सहायता और समर्थन",
    LanguageConst.rateUs: "हमें रेट करें",
    LanguageConst.logout: "लॉग आउट",
    // Profile
    LanguageConst.pleaseCAAYNDFYBP:
        "कृपया अपना बुकिंग प्रोफ़ाइल जोड़ें और आवश्यक विवरण जांचें",
    LanguageConst.enterYourName: "अपना नाम दर्ज करें",
    LanguageConst.mobile: "मोबाइल",
    LanguageConst.location: "स्थान",
    // Language
    LanguageConst.searchForLanguages: "भाषाएं खोजें",
    // Transaction
    LanguageConst.transaction: "लेन-देन",
    LanguageConst.searchForTransactions: "लेन-देन खोजें",
    // My Address
    LanguageConst.yourSavedAddresses: "आपके सहेजे गए पते",
    // Add New Address
    LanguageConst.addNewAddress: "नया पता जोड़ें",
    LanguageConst.searchFASA: "उपलब्ध सेवा क्षेत्र खोजें",
    LanguageConst.houseNoBuildingName: "मकान नंबर / बिल्डिंग का नाम",
    LanguageConst.enterHouseNo: "मकान नंबर दर्ज करें",
    LanguageConst.addressTitle: "पता शीर्षक",
    LanguageConst.contactName: "संपर्क नाम",
    LanguageConst.contactNumber: "संपर्क नंबर",
    // FAQ’s
    LanguageConst.stillNeedHelpContactUs:
        "अभी भी सहायता चाहिए! हमसे संपर्क करें",
    LanguageConst.q: "प्रश्न",
    LanguageConst.a: "उत्तर",
    // Payment Methods
    LanguageConst.currentMethod: "वर्तमान तरीका",
    LanguageConst.defaultMethod: "डिफ़ॉल्ट तरीका",
    LanguageConst.choosYDPMFOPIWYACOAYC:
        "ऑनलाइन भुगतान के लिए अपना पसंदीदा तरीका चुनें या अपने कार्ड जोड़ें",
    LanguageConst.cashOnDelivery: "डिलिवरी पर नकद",
    LanguageConst.increaseInCharges: "शुल्क में वृद्धि",
    LanguageConst.expiresOn: "समाप्ति तिथि",
    LanguageConst.upi: "यूपीआई",
    LanguageConst.addYourUPIID: "अपना यूपीआई आईडी जोड़ें",
    LanguageConst.enterYourUPIID: "अपना यूपीआई आईडी दर्ज करें",
    LanguageConst.paytm: "पेटीएम",
    LanguageConst.addYourMobileNo: "अपना मोबाइल नंबर जोड़ें",
    // Add card
    LanguageConst.addCard: "कार्ड जोड़ें",
    LanguageConst.addBankCard: "बैंक कार्ड जोड़ें",
    LanguageConst.addNewCard: "नया कार्ड जोड़ें",
    LanguageConst.streamlineCheckoutProcess:
        "भविष्य के लेन-देन के लिए नया कार्ड जोड़कर अपने चेकआउट प्रक्रिया को सुव्यवस्थित करें। आपका कार्ड विवरण उन्नत एन्क्रिप्शन तकनीक से सुरक्षित है।",
    LanguageConst.cardNo: "कार्ड नंबर",
    LanguageConst.expiryDate: "समाप्ति तिथि",
    LanguageConst.cvv: "सीवीवी",
    LanguageConst.mmyy: "महीना/साल",
    LanguageConst.cardholdersName: "कार्डधारक का नाम",
    LanguageConst.enterCardholdersFullName: "कार्डधारक का पूरा नाम दर्ज करें",
    LanguageConst.addMycard: "मेरा कार्ड जोड़ें",
    // Bank Popup
    LanguageConst.bankCardAddedSuccessfully: "बैंक कार्ड सफलतापूर्वक जोड़ा गया",
    LanguageConst.pleaseWaitForDetails:
        "कृपया प्रतीक्षा करें, हम आवश्यक विवरण ले रहे हैं",
    // Notification
    LanguageConst.notificationSetting: "अधिसूचना सेटिंग",
    LanguageConst.inAppNotification: "ऐप में अधिसूचना",
    LanguageConst.getInAppNotification: "ऐप के भीतर अधिसूचना प्राप्त करें",
    LanguageConst.systemNotification: "सिस्टम अधिसूचना",
    LanguageConst.getSystemNotification: "ऐप के बाहर अधिसूचना प्राप्त करें",
    LanguageConst.behaviour: "व्यवहार",
    LanguageConst.allowNTWTD: "डिवाइस को जगाने के लिए अधिसूचना की अनुमति दें",
    LanguageConst.disableNV: "अधिसूचना कंपन अक्षम करें",
    LanguageConst.doNotDisturb: "परेशान न करें",
    // Help & Support
    LanguageConst.youCCOEASFYCAH:
        "आप हमारे विशेषज्ञों और समर्थन से संपर्क कर सकते हैं अपने पुष्टि और सहायता के लिए",
    LanguageConst.customerServices: "ग्राहक सेवा",
    LanguageConst.whatsApp: "व्हाट्सएप",
    LanguageConst.deleteMyAccount: "मेरा खाता हटाएं",
    LanguageConst.tollFreeNumber: "टोल फ्री नंबर",
    // Customer Service
    LanguageConst.customerService: "ग्राहक सेवा",
    LanguageConst.message: "संदेश",
    // Delete Account
    LanguageConst.deleteAccount: "खाता हटाएं",
    LanguageConst.ifYWTDAYAPTPRFDA:
        "यदि आप खाता हटाना चाहते हैं, तो आपको खाता हटाने का कारण बताने के लिए प्रेरित किया जाएगा",
    LanguageConst.noLUTSP: "अब सेवा प्लेटफॉर्म का उपयोग नहीं करता",
    LanguageConst.foundBA: "बेहतर विकल्प मिला",
    LanguageConst.tooMEN: "बहुत अधिक ईमेल / अधिसूचनाएं",
    LanguageConst.difficultNIP: "प्लेटफॉर्म में नेविगेशन कठिन",
    LanguageConst.accountSC: "खाता सुरक्षा चिंताएं",
    LanguageConst.personalReason: "व्यक्तिगत कारण",
    LanguageConst.other: "अन्य",
    LanguageConst.typeHere: "यहाँ लिखें",
    // Delete Account Popup
    LanguageConst.areYouSure: "क्या आप सुनिश्चित हैं?",
    LanguageConst.youWTDYAP: "आप अपना खाता स्थायी रूप से हटाना चाहते हैं",
    LanguageConst.ensuringTTUUCTDTALD:
        "सुनिश्चित करना कि उपयोगकर्ता अपने खाते को हटाने के परिणामों (डेटा की हानि) को समझते हैं",
    LanguageConst.keepAccount: "खाता रखें",
    // Rate us Popup
    LanguageConst.letsKWYLAWWCGBREATYRB:
        "हमें बताएं कि आपको क्या पसंद है और हम कहां बेहतर हो सकते हैं। हमें रेट करें और नीचे अपनी प्रतिक्रिया टाइप करें।",
    LanguageConst.rateYourExperience: "अपना अनुभव रेट करें",
    LanguageConst.ouchPTUWWCI:
        "उफ़! कृपया हमें बताएं कि हम क्या सुधार कर सकते हैं",
    LanguageConst.contactUs: "संपर्क करें",
    LanguageConst.submit: "जमा करें",
    // Logout Popup
    LanguageConst.areYouSureLogout: "क्या आप लॉगआउट करना चाहते हैं?",
    LanguageConst.no: "नहीं",
    LanguageConst.yes: "हाँ",
    // ACCOUNT HINDI LANGUAGE END ----->
  };
}

//  LANGUAGE CONST
class LanguageConst {
  // Exit Dialog LANGUAGE CONST START ----->
  static const String areYSYWT = "areYSYWT";
  static const String exit = "exit";

  // SETTING LANGUAGE CONST START ----->
  static const String setting = "Setting";

  // Image Pick LANGUAGE CONST START ----->
  static const String profilePhoto = "profilePhoto";
  static const String gallery = "gallery";
  static const String camera = "camera";

  // AUTHENTICATION LANGUAGE CONST START ----->
  // LOGIN
  static const String welcome = "Welcome";
  static const String gladTSy = "GladTSy";
  static const String userE = "UserE";
  static const String enterUE = "EnterUE";
  static const String password = "Password";
  static const String enterP = "EnterP";
  static const String login = "Login";
  static const String forgotP = "ForgotP?";
  static const String or = "or";
  static const String newTRRn = "NewTR!Rn?";
  // REGISTER FORM
  static const String personalD = "PersonalD";
  static const String pleaseFaRdfR = "PleaseFaRdfR";
  static const String name = "Name";
  static const String enterN = "EnterN";
  static const String phoneN = "PhoneN";
  static const String enterYpn = "EnterYpn";
  static const String email = "Email";
  static const String enterYe = "EnterYe";
  static const String next = "Next";
  // REGISTER ADDRESS
  static const String addressD = "AddressD";
  static const String pleaseFaanaD = "PleaseFaanaD";
  static const String title = "Title";
  static const String enterTfyA = "EnterTfyA";
  static const String streetA = "StreetA";
  static const String fillYsa = "FillYsa";
  static const String city = "City";
  static const String select = "Select";
  static const String state = "State";
  static const String country = "Country";
  static const String postalC = "PostalC";
  static const String enterField = "Enter";
  // REGISTER KYC
  static const String kycD = "KYCD";
  static const String skip = "Skip";
  static const String documentT = "DocumentT";
  static const String selectYdt = "SelectYdt";
  static const String documentN = "DocumentN";
  static const String fillYpdn = "FillYpdn";
  static const String documentED = "DocumentED";
  static const String uploadDocument = "uploadDocument";
  static const String uploadDmax50mb = "UploadD(max50mb)";
  static const String browse = "Browse?";
  static const String save = "Save";
  static const String saveChanges = "SaveChanges";
  // REGISTER POPUP
  static const String accountCS = "AccountCS";
  static const String pleaseWwtaytlp = "PleaseWwtaytlp";
  // FORGOT PASSWORD
  static const String forgotPassword = "ForgotP";
  static const String pleaseEyemoWcsytvc = "PleaseEyemoWcsytvc";
  static const String emailOrMobile = "EmailOm";
  static const String enterUEOM = "enterUEOM";
  static const String continueText = "Continue";
  static const String backToLogin = "BackTL";
  // FORGOT VERIFICATION
  static const String verificationS = "VerificationS";
  static const String weHsavcoD = "WeHsavcoD";
  static const String secL = "SecL";
  static const String resendOTP = "ResendOTP?";
  static const String verify = "Verify";
  // FORGOT NEW PASSWORD
  static const String createNp = "CreateNp";
  static const String pleaseEynpfyas = "PleaseEynpfyas";
  static const String newP = "NewP";
  static const String confirmP = "ConfirmP";
  // FORGOT POPUP
  static const String passwordCS = "PasswordCS";
  // AUTHENTICATION LANGUAGE CONST END ----->

  // HOME LANGUAGE CONST START ----->
  // HOME POPUP
  static const String allowCRTATDL = "AllowCRTATDL";
  static const String tastIMSLSWTTPA = "TASTIMSLSWTTPA";
  static const String precise = "Precise";
  static const String approximate = "Approximate";
  static const String whileUTA = "WhileUTA";
  static const String onlyTT = "OnlyTT";
  static const String dontA = "DontA";
  // HOME SCREEN
  static const String searchFRAC = "SearchFRAC";
  static const String topRC = "TopRC";
  static const String viewA = "ViewA";
  static const String petrol = "Petrol";
  static const String auto = "Auto";
  static const String seats = "Seats";
  static const String seeD = "SeeD";
  static const String myB = "MyB";
  static const String seeA = "SeeA";
  static const String bookingID = "BookingID";
  static const String day = "Day";
  static const String findYCAP = "FindYCAP";
  static const String findMC = "FindMC";
  static const String reviews = "Reviews";
  static const String hrA = "HrA";
  // BOTTOM NAVIGATION BAR TEXT
  static const String home = "Home";
  static const String bookings = "Bookings";
  static const String account = "Account";
  // NOTIFICATIONS SCREEN
  static const String notifications = "Notifications";
  static const String searchFM = "SearchFM";
  static const String booking = "Booking";
  // HOME LANGUAGE CONST END ----->

  // VEHICLE BOOKING LANGUAGE CONST START ----->
  // Filter
  static const category = "category";
  static const priceRate = "priceRate";
  static const fuel = "fuel";
  static const transmission = "transmission";
  static const seating = "seating";
  static const suv = "suv";
  static const sports = "sports";
  static const coupe = "coupe";
  static const sedan = "sedan";
  static const scorpio = "scorpio";
  static const casual = "casual";
  static const vintage = "vintage";
  // Price rate
  static const perHourly = "perHourly";
  static const perDay = "perDay";
  static const perKilometer = "perKilometer";
  // Fuel
  static const gas = "gas";
  static const diesel = "diesel";
  // Transmission
  static const automatic = "automatic";
  static const manual = "manual";
  // Find Car
  static const searchFRC = "searchFRC";
  static const carATWL = "carATWL";
  // Car Perview
  static const available = "available";
  static const review = "review";
  static const priceR = "priceR";
  static const introduction = "introduction";
  static const carDetails = "carDetails";
  static const carMake = "carMake";
  static const color = "color";
  static const licensePlateNo = "licensePlateNo";
  static const seatingCapacity = "seatingCapacity";
  static const similarVehicles = "similarVehicles";
  static const rentNow = "rentNow";
  // Car image and video
  static const photos = "photos";
  static const videos = "videos";
  // VEHICLE BOOKING LANGUAGE CONST  END ----->

  // BOOKINGS  LANGUAGE CONST  START ----->
  // Bookings
  static const searchForBookings = "searchForBookings";
  static const upcoming = "upcoming";
  static const completed = "completed";
  // Booking detail
  static const bookingDetails = "bookingDetails";
  static const off = "off";
  static const address = "address";
  static const destination = "destination";
  static const timeAndDate = "timeAndDate";
  static const amount = "amount";
  static const modeOfPayment = "modeOfPayment";
  static const couponCodeApplied = "couponCodeApplied";
  static const cancel = "cancel";
  static const ok = "ok";
  static const payNow = "payNow";
  // Payment Sucessfull popup
  static const transactionID = "transactionID";
  static const paymentSuccessful = "paymentSuccessful";
  static const paymentTo = "paymentTo";
  static const changeTimeDate = "changeTimeDate";
  static const time = "time";
  static const date = "date";
  static const promoCodeApplied = "promoCodeApplied";
  static const paidAmount = "paidAmount";
  // BOOKINGS LANGUAGE CONST END ----->

  // PAYMENT AND ADDRESS LANGUAGE CONST  START ----->
  // Wish list
  static const wishList = "wishList";
  static const herAYSCFTBIWASTWLSYCBLE = "herAYSCFTBIWASTWLSYCBLE";
  static const car = "car";
  static const payment = "payment";
  static const totalAmount = "TotalAmount";
  // Add Address
  static const addAddress = "addAddress";
  static const fillOrSelectLocation = "fillOrSelectLocation";
  static const addressDefault = "addressDefault";
  static const choseyourDestination = "Chose your Destination";
  static const totalKilometers = "totalKilometers";
  static const kilometers = "kilometers";
  static const perKm = "perKm";
  // Payment
  static const hereIYBRFASV = "hereIYBRFASV";
  static const setTimeAndDate = "setTimeAndDate";
  static const cash = "cash";
  static const online = "online";
  static const saveMoreOnBooking = "saveMoreOnBooking";
  static const apply = "apply";
  static const applied = "applied";
  static const taxPercentGST = "taxPercentGST";
  static const couponDiscount = "couponDiscount";
  // Date and Time Popup
  static const setTime = "setTime";
  static const setDate = "setDate";
  static const reset = "reset";
  // PAYMENT AND ADDRESS LANGUAGE CONST  END ----->

  // ACCOUNT LANGUAGE CONST  START ----->
  // Account
  static const availableBalance = "availableBalance";
  static const general = "general";
  static const profile = "profile";
  static const myAddress = "myAddress";
  static const language = "language";
  static const myTransactions = "myTransactions";
  static const settingsAndPrivacy = "settingsAndPrivacy";
  static const paymentMethods = "paymentMethods";
  static const privacyPolicy = "privacyPolicy";
  static const termsAndCondition = "termsAndCondition";
  static const faqs = "faqs";
  static const helpAndSupport = "helpAndSupport";
  static const rateUs = "rateUs";
  static const logout = "logout";
  // Profile
  static const pleaseCAAYNDFYBP = "pleaseCAAYNDFYBP";
  static const enterYourName = "enterYourName";
  static const mobile = "mobile";
  static const location = "location";
  // Language
  static const searchForLanguages = "searchForLanguages";
  // Transaction
  static const transaction = "transaction";
  static const searchForTransactions = "searchForTransactions";
  // My Address
  static const yourSavedAddresses = "yourSavedAddresses";
  // Add New Address
  static const addNewAddress = "addNewAddress";
  static const searchFASA = "searchFASA";
  static const houseNoBuildingName = "houseNoBuildingName";
  static const enterHouseNo = "enterHouseNo";
  static const addressTitle = "addressTitle";
  static const contactName = "contactName";
  static const contactNumber = "contactNumber";
  // FAQ’s
  static const stillNeedHelpContactUs = "stillNeedHelpContactUs";
  static const q = "q";
  static const a = "a";
  // Payment Methods
  static const currentMethod = "currentMethod";
  static const defaultMethod = "defaultMethod";
  static const choosYDPMFOPIWYACOAYC = "choosYDPMFOPIWYACOAYC";
  static const cashOnDelivery = "cashOnDelivery";
  static const increaseInCharges = "increaseInCharges";
  static const expiresOn = "expiresOn";
  static const upi = "upi";
  static const addYourUPIID = "addYourUPIID";
  static const enterYourUPIID = "enterYourUPIID";
  static const paytm = "paytm";
  static const addYourMobileNo = "addYourMobileNo";
  // Add card
  static const addCard = "addCard";
  static const addBankCard = "addBankCard";
  static const addNewCard = "addNewCard";
  static const streamlineCheckoutProcess = "streamlineCheckoutProcess";
  static const cardNo = "cardNo";
  static const expiryDate = "expiryDate";
  static const cvv = "cvv";
  static const mmyy = "mmyy";
  static const cardholdersName = "cardholdersName";
  static const enterCardholdersFullName = "enterCardholdersFullName";
  static const addMycard = "Add My card";
  // Bank Popup
  static const bankCardAddedSuccessfully = "bankCardAddedSuccessfully";
  static const pleaseWaitForDetails = "pleaseWaitForDetails";
  // Notification
  static const notificationSetting = "notificationSetting";
  static const inAppNotification = "inAppNotification";
  static const getInAppNotification = "getInAppNotification";
  static const systemNotification = "systemNotification";
  static const getSystemNotification = "getSystemNotification";
  static const behaviour = "behaviour";
  static const allowNTWTD = "allowNTWTD";
  static const disableNV = "disableNV";
  static const doNotDisturb = "doNotDisturb";
  // Help & Support
  static const youCCOEASFYCAH = "youCCOEASFYCAH";
  static const customerServices = "customerServices";
  static const whatsApp = "whatsApp";
  static const deleteMyAccount = "deleteMyAccount";
  static const tollFreeNumber = "tollFreeNumber";
  // Customer Service
  static const customerService = "customerService";
  static const message = "message";
  // Delete Account
  static const deleteAccount = "deleteAccount";
  static const ifYWTDAYAPTPRFDA = "ifYWTDAYAPTPRFDA";
  static const noLUTSP = "noLUTSP";
  static const foundBA = "foundBA";
  static const tooMEN = "tooMEN";
  static const difficultNIP = "difficultNIP";
  static const accountSC = "accountSC";
  static const personalReason = "personalReason";
  static const other = "other";
  static const typeHere = "typeHere";
  // Delete Account Popup
  static const areYouSure = "areYouSure";
  static const youWTDYAP = "youWTDYAP";
  static const ensuringTTUUCTDTALD = "ensuringTTUUCTDTALD";
  static const keepAccount = "keepAccount";
  // Rate us Popup
  static const letsKWYLAWWCGBREATYRB = "letsKWYLAWWCGBREATYRB";
  static const rateYourExperience = "rateYourExperience";
  static const ouchPTUWWCI = "ouchPTUWWCI";
  static const contactUs = "contactUs";
  static const submit = "submit";
  // Logout Popup
  static const areYouSureLogout = "areYouSureLogout";
  static const no = "no";
  static const yes = "yes";
  // ACCOUNT LANGUAGE CONST  END ----->
}
