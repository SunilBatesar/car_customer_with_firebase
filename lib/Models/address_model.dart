import 'package:car_booking_customer/Models/firebase_response_model.dart';

class AddressModel {
  String? id;
  double? latitude;
  double? longitude;
  String? addressTitle;
  String? houseNoBuildingName;
  String? contactName;
  String? contactNumber;
  AddressModel({
    this.id,
    this.latitude,
    this.longitude,
    this.addressTitle,
    this.houseNoBuildingName,
    this.contactName,
    this.contactNumber,
  });

  AddressModel copyWith({
    String? id,
    double? latitude,
    double? longitude,
    String? addressTitle,
    String? houseNoBuildingName,
    String? contactName,
    String? contactNumber,
  }) {
    return AddressModel(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      addressTitle: addressTitle ?? this.addressTitle,
      houseNoBuildingName: houseNoBuildingName ?? this.houseNoBuildingName,
      contactName: contactName ?? this.contactName,
      contactNumber: contactNumber ?? this.contactNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'addressTitle': addressTitle,
      'houseNoBuildingName': houseNoBuildingName,
      'contactName': contactName,
      'contactNumber': contactNumber,
    };
  }

  AddressModel.fromjson(FirebaseResponseModel json)
      : id = json.data["id"] ?? "",
        latitude = json.data['latitude'].toDouble() ?? 0.0,
        longitude = json.data['longitude'].toDouble() ?? 0.0,
        addressTitle = json.data['addressTitle'] ?? "",
        houseNoBuildingName = json.data['houseNoBuildingName'] ?? "",
        contactName = json.data['contactName'] ?? "",
        contactNumber = json.data['contactNumber'] ?? "";
}
