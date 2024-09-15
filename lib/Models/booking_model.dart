import 'package:car_booking_customer/Models/car_model.dart';
import 'package:car_booking_customer/Models/firebase_response_model.dart';
import 'package:car_booking_customer/Models/user_model.dart';

class BookingModel {
  String? id;
  String? time;
  String? date;
  String? amount;
  String? paymentType;
  String? address;
  String? destination;
  // BookingState? bookingState;
  UserModel? user;
  List<CarModel>? cars;

  BookingModel({
    this.id,
    this.time,
    this.date,
    this.amount,
    this.paymentType,
    this.address,
    this.destination,
    // this.bookingState,
    this.user,
    this.cars,
  });
  // BOOKING TO MAP
  Map<String, dynamic> tomap() {
    return {
      "time": time ?? DateTime.now().millisecondsSinceEpoch.toString(),
      "date": date ?? DateTime.now().millisecondsSinceEpoch.toString(),
      "amount": amount ?? 0,
      "address": address ?? "",
      "destination": destination ?? "",
      "paymentType": paymentType ?? "",
      // "bookingState": bookingState ?? BookingState.REQUEST,
      "user": user!.toUserBooking(),
      "cars": cars!.map((e) => e.toCarBookings()),
    };
  }

  // BOOKING FROM JSON
  BookingModel.fromjson(FirebaseResponseModel json)
      : id = json.docId,
        time = json.data["time"] ?? "",
        date = json.data["date"] ?? "",
        amount = json.data["amount"] ?? 0,
        // bookingState = json.data["bookingState"] ?? BookingState.PENDING,
        address = json.data["address"] ?? "",
        destination = json.data["destination"] ?? "",
        paymentType = json.data["paymentType"] ?? "",
        user = UserModel.fromUserBooking(
            FirebaseResponseModel(json.data["user"] ?? {}, "")),
        cars = ((json.data["cars"] ?? []) as List)
            .map((e) => CarModel.fromCarBookings(FirebaseResponseModel(e, "")))
            .toList();

  // COPY WITH
  BookingModel copyWith({
    String? id,
    String? time,
    String? date,
    String? amount,
    String? address,
    String? description,
    // BookingState? bookingState,
    String? paymentType,
    UserModel? user,
    List<CarModel>? cars,
  }) {
    return BookingModel(
      id: id ?? this.id,
      time: time ?? this.time,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      address: address ?? this.address,
      destination: destination ?? destination,
      // bookingState: bookingState ?? this.bookingState,
      paymentType: paymentType ?? this.paymentType,
      user: user ?? this.user,
      cars: cars ?? this.cars,
    );
  }
}
