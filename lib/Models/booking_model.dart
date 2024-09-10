import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Models/firebase_response_model.dart';
import 'package:car_booking_customer/Models/user_model.dart';

class BookingModel {
  String? id;
  String? time;
  String? amount;
  UserModel? user;
  List<CarModel>? cars;

  BookingModel({
    this.id,
    this.time,
    this.amount,
    this.user,
    this.cars,
  });
  BookingModel.fromjson(FirebaseResponseModel json)
      : id = json.docId,
        time = json.data["time"],
        amount = json.data["amount"],
        user = json.data["user"],
        cars = json.data["cars"];
}
