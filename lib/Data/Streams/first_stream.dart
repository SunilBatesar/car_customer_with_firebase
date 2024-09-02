import 'package:car_booking_customer/Controllers/user_controller.dart';
import 'package:car_booking_customer/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirstStream {
  final userID = Get.find<UserController>().userdata.data!.id;
  Stream<DocumentSnapshot<Map<String, dynamic>>> streamdata() {
    return styleSheet.apis.userDocument(userID!).snapshots();
  }
}
