import 'package:car_booking_customer/Models/firebase_response_model.dart';

class UserModel {
  String? id,
      name,
      email,
      phonenumber,
      image,
      titleAddress,
      streetaddress,
      country,
      state,
      city,
      postalcode,
      documenttype,
      documentnumber,
      documentexpirydate,
      documentimage;
  bool? owner, customer;
  UserModel(
      {this.id = "",
      this.name = "",
      this.email = "",
      this.phonenumber = "",
      this.image = "",
      this.owner = false,
      this.customer = false,
      this.titleAddress = "",
      this.streetaddress = "",
      this.country = "",
      this.state = "",
      this.city = "",
      this.postalcode = "",
      this.documenttype = "",
      this.documentnumber = "",
      this.documentexpirydate = "",
      this.documentimage = ""});

//  Copy With
  UserModel copyWith(
      {String? id,
      String? name,
      String? email,
      String? phonenumber,
      String? image,
      bool? owner,
      bool? customer,
      String? titleAddress,
      String? streetaddress,
      String? country,
      String? state,
      String? city,
      String? postalcode,
      String? documenttype,
      String? documentnumber,
      String? documentexpirydate,
      String? documentimage}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phonenumber: phonenumber ?? this.phonenumber,
      image: image ?? this.image,
      owner: owner ?? this.owner,
      customer: customer ?? this.customer,
      titleAddress: titleAddress ?? this.titleAddress,
      streetaddress: streetaddress ?? this.streetaddress,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      postalcode: postalcode ?? this.postalcode,
      documenttype: documenttype ?? this.documenttype,
      documentnumber: documentnumber ?? this.documentnumber,
      documentexpirydate: documentexpirydate ?? this.documentexpirydate,
      documentimage: documentimage ?? this.documentimage,
    );
  }

  // To Map
  Map<String, dynamic> tomap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phonenumber": phonenumber,
      "image": image,
      "owner": owner,
      "customer": customer,
      "titleAddress": titleAddress,
      "streetaddress": streetaddress,
      "country": country,
      "state": state,
      "city": city,
      "postalcode": postalcode,
      "documenttype": documenttype,
      "documentnumber": documentnumber,
      "documentexpirydate": documentexpirydate,
      "documentimage": documentimage,
    };
  }

  // From Json
  UserModel.fromjson(FirebaseResponseModel json)
      : id = json.docId,
        name = json.data["name"] ?? "",
        email = json.data["email"] ?? "",
        phonenumber = json.data["phonenumber"] ?? "",
        image = json.data["image"] ?? "",
        owner = json.data["owner"] ?? false,
        customer = json.data["customer"] ?? false,
        titleAddress = json.data["titleAddress"] ?? "",
        streetaddress = json.data["streetaddress"] ?? "",
        country = json.data["country"] ?? "",
        state = json.data["state"] ?? "",
        city = json.data["city"] ?? "",
        postalcode = json.data["postalcode"] ?? "",
        documenttype = json.data["documenttype"] ?? "",
        documentnumber = json.data["documentnumber"] ?? "",
        documentexpirydate = json.data["documentexpirydate"] ?? "",
        documentimage = json.data["documentimage"] ?? "";

  // USER MODEL USE TO BOOKING MODEL //
  // CREATE TO MAP
  Map<String, dynamic> toUserBooking() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phonenumber": phonenumber,
      "image": image,
      "owner": owner,
      "customer": customer,
      "titleAddress": titleAddress,
      "streetaddress": streetaddress,
      "country": country,
      "state": state,
      "city": city,
      "postalcode": postalcode,
      "documenttype": documenttype,
      "documentnumber": documentnumber,
      "documentexpirydate": documentexpirydate,
      "documentimage": documentimage,
    };
  }

  // From Json
  UserModel.fromUserBooking(FirebaseResponseModel json)
      : id = json.data["id"]??"",
        name = json.data["name"] ?? "",
        email = json.data["email"] ?? "",
        phonenumber = json.data["phonenumber"] ?? "",
        image = json.data["image"] ?? "",
        owner = json.data["owner"] ?? false,
        customer = json.data["customer"] ?? false,
        titleAddress = json.data["titleAddress"] ?? "",
        streetaddress = json.data["streetaddress"] ?? "",
        country = json.data["country"] ?? "",
        state = json.data["state"] ?? "",
        city = json.data["city"] ?? "",
        postalcode = json.data["postalcode"] ?? "",
        documenttype = json.data["documenttype"] ?? "",
        documentnumber = json.data["documentnumber"] ?? "",
        documentexpirydate = json.data["documentexpirydate"] ?? "",
        documentimage = json.data["documentimage"] ?? "";
}
