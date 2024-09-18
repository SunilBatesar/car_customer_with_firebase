import 'package:car_booking_customer/Models/firebase_response_model.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';

//  CAR MODEL
class CarModel {
  String? id;
  String? title;
  double? price;
  DateTime? createdAt;
  DateTime? updateAt;
  bool? isAvailable;
  int? bookingquantity;
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
  String? packagetype;
  String? carcolor;
  List<String>? videos;
  List<String>? image;
  List<CreatePackageModel>? package;

  CarModel({
    this.addedAt,
    this.id,
    this.createdAt,
    this.dicountCode,
    this.discount,
    this.image,
    this.isAvailable,
    this.price,
    this.bookingquantity = 1,
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
    this.package,
  });
  //  CAR MODEL FROM JSON
  CarModel.fromjson(FirebaseResponseModel json)
      : id = json.docId,
        companyname = json.data["companyname"] ?? "",
        carmodel = json.data["carmodel"] ?? "",
        price = json.data["price"]?.toDouble(),
        bookingquantity =
            json.data['bookingquantity'] ?? 1, //  ONLYE USE ON BOOKING LENGTH
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
        package = ((json.data["createpackagedata"] ?? []) as List)
            .map((e) =>
                CreatePackageModel.fromjson(FirebaseResponseModel(e, "")))
            .toList();

  //  BOOKING TO JSON
  Map<String, dynamic> toCarBookings() {
    return {
      "car_id": id ?? "",
      "title": title ?? "",
      "carmodel": carmodel ?? "",
      "transmission": transmission ?? "",
      "seatingcapacity": seatingcapacity ?? "",
      "fuel": fuel ?? "",
      "companyname": companyname ?? "",
      "manufactureyear": manufactureyear ?? "",
      "package": package!.map((e) => e.tomap()),
      "isAvailable": isAvailable ?? true,
      "bookingquantity": bookingquantity ?? 1,
      "discount": discount ?? 0.0,
      "discountCode": dicountCode ?? "",
      "image": image!.map((e) => e.toString()),
    };
  }

  //  BOOKING FROM
  CarModel.fromCarBookings(FirebaseResponseModel json)
      : id = json.data["car_id"] ?? "",
        title = json.data["title"] ?? "",
        companyname = json.data["companyname"] ?? "",
        carmodel = json.data["carmodel"] ?? "",
        transmission = json.data["transmission"] ?? "",
        seatingcapacity = json.data["seatingcapacity"] ?? "",
        fuel = json.data["fuel"] ?? "",
        manufactureyear = json.data["manufactureyear"] ?? "",
        package = ((json.data["package"] ?? []) as List)
            .map((e) =>
                CreatePackageModel.fromjson(FirebaseResponseModel(e ?? {}, "")))
            .toList(),
        isAvailable = json.data["isAvailable"] ?? true,
        bookingquantity = json.data["bookingquantity"] ?? 1,
        discount = json.data["discount"].toDouble(),
        dicountCode = json.data["dicountCode"] ?? "",
        image = ((json.data["image"] ?? []) as List)
            .map((e) => e.toString())
            .toList();

  //  COPY WITH
  CarModel copyWith({
    String? id,
    String? title,
    double? price,
    DateTime? createdAt,
    DateTime? updateAt,
    bool? isAvailable,
    int? bookingquantity,
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
    List<CreatePackageModel>? package,
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
      bookingquantity: bookingquantity ?? this.bookingquantity,
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
      package: package ?? this.package,
      packagetype: packagetype ?? this.packagetype,
      carcolor: carcolor ?? this.carcolor,
      videos: videos ?? this.videos,
      image: image ?? this.image,
    );
  }
}

// CREATEPACKAGE MODEL
class CreatePackageModel {
  String? packagetype;
  int? ammount;
  PackageType? type;
  CreatePackageModel({
    this.packagetype,
    this.ammount,
    this.type,
  });
  CreatePackageModel copywith({
    String? packagetype,
    int? ammount,
    PackageType? type,
  }) {
    return CreatePackageModel(
      packagetype: packagetype ?? this.packagetype,
      ammount: ammount ?? this.ammount,
      type: type ?? this.type,
    );
  }

  CreatePackageModel.fromjson(FirebaseResponseModel json)
      : packagetype = json.data["packagetype"] ?? "",
        ammount = json.data["ammount"] ?? "",
        type = PackageType.values.firstWhere(
          (e) => e.name == json.data["type"],
          orElse: () => PackageType.HOUR,
        );

  Map<String, dynamic> tomap() {
    return {
      "packagetype": packagetype ?? "",
      "ammount": ammount ?? 0,
      "type": type!.name,
    };
  }
}
