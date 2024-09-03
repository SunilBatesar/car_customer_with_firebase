import 'package:car_booking_customer/Models/firebase_response_model.dart';

//  CAR MODEL
class CarModel {
  String? id;
  String? title;
  double? price;
  DateTime? createdAt;
  DateTime? updateAt;
  bool? isAvailable;
  int? quantity;
  double? discount;
  String? dicountCode;
  DateTime? addedAt;
  String? companyname;
  String? carmodel;
  String? platenumber;
  String? transmission;
  String? seatingcapacity;
  String? fuel;
  String? category;
  String? manufactureyear;
  String? description;
  double? ammount;
  String? packagetype;
  String? carcolor;
  List<String>? videos;
  List<String>? image;

  CarModel(
      {this.addedAt,
      this.id,
      this.createdAt,
      this.dicountCode,
      this.discount,
      this.image,
      this.isAvailable,
      this.price,
      this.quantity,
      this.title,
      this.updateAt,
      this.companyname,
      this.carmodel,
      this.platenumber,
      this.transmission,
      this.seatingcapacity,
      this.fuel,
      this.category,
      this.manufactureyear,
      this.description,
      this.carcolor,
      this.videos,
      this.packagetype,
      this.ammount});
  CarModel.fromcars(FirebaseResponseModel map) : id = map.docId;

  //  CAR MODEL FROM JSON
  CarModel.fromjson(FirebaseResponseModel json)
      : id = json.docId,
        companyname = json.data["companyname"] ?? "",
        carmodel = json.data["carmodel"] ?? "",
        price = json.data["price"]?.toDouble(),
        platenumber = json.data["platenumber"] ?? "",
        transmission = json.data["transmission"] ?? "",
        seatingcapacity = json.data["seatingcapacity"] ?? "",
        fuel = json.data["fuel"] ?? "",
        category = json.data["category"] ?? "",
        manufactureyear = json.data["manufactureyear"] ?? "",
        description = json.data["description"] ?? "",
        carcolor = json.data["carcolor"] ?? "",
        image = ((json.data["image"] ?? []) as List)
            .map((e) => e.toString())
            .toList(),
        videos = ((json.data["videos"] ?? []) as List)
            .map((e) => e.toString())
            .toList(),
        packagetype = json.data["packagetype"] ?? "",
        ammount = json.data["ammount"]?.toDouble();

  //  ORDER TO JSON
  Map<String, dynamic> toOrderjson() {
    return {
      "title": title ?? "",
      "price": price ?? 0.0,
      "isAvailable": isAvailable ?? true,
      "quantity": quantity ?? 1,
      "discount": discount ?? 0.0,
      "discountCode": dicountCode ?? "",
    };
  }

  //  ORDER FROM
  CarModel.fromCarOrder(FirebaseResponseModel json)
      : id = json.docId,
        title = json.data["title"] ?? "",
        price = json.data["price"]?.toDouble(),
        isAvailable = json.data["isAvailable"] ?? true,
        quantity = json.data["quantity"].toInt(),
        discount = json.data["discount"].toDouble(),
        dicountCode = json.data["dicountCode"] ?? "";

  //  COPY WITH
  CarModel copyWith({
    String? id,
    String? title,
    double? price,
    DateTime? createdAt,
    DateTime? updateAt,
    bool? isAvailable,
    int? quantity,
    double? discount,
    String? dicountCode,
    DateTime? addedAt,
    String? companyname,
    String? carmodel,
    String? platenumber,
    String? transmission,
    String? seatingcapacity,
    String? fuel,
    String? category,
    String? manufactureyear,
    String? description,
    double? ammount,
    String? packagetype,
    String? carcolor,
    List<String>? videos,
    List<String>? image,
  }) {
    return CarModel(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
      isAvailable: isAvailable ?? this.isAvailable,
      quantity: quantity ?? this.quantity,
      discount: discount ?? this.discount,
      dicountCode: dicountCode ?? this.dicountCode,
      addedAt: addedAt ?? this.addedAt,
      companyname: companyname ?? this.companyname,
      carmodel: carmodel ?? this.carmodel,
      platenumber: platenumber ?? this.platenumber,
      transmission: transmission ?? this.transmission,
      seatingcapacity: seatingcapacity ?? this.seatingcapacity,
      fuel: fuel ?? this.fuel,
      category: category ?? this.category,
      manufactureyear: manufactureyear ?? this.manufactureyear,
      description: description ?? this.description,
      ammount: ammount ?? this.ammount,
      packagetype: packagetype ?? this.packagetype,
      carcolor: carcolor ?? this.carcolor,
      videos: videos ?? this.videos,
      image: image ?? this.image,
    );
  }
}
