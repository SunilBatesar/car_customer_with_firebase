class UserModel {
  String id, name, email, phonenumber, image;
  bool owner, customer;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phonenumber,
    required this.image,
    required this.owner,
    required this.customer,
  });

//  Copy With
  UserModel copyWith(
      {String? id,
      String? name,
      String? email,
      String? phonenumber,
      String? image,
      bool? owner,
      bool? customer}) {
    return UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phonenumber: phonenumber ?? this.phonenumber,
        image: image ?? this.image,
        owner: owner ?? this.owner,
        customer: customer ?? this.customer);
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
    };
  }

  // From Json
  UserModel.fromjson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        name = json["name"] ?? "",
        email = json["email"] ?? "",
        phonenumber = json["phonenumber"] ?? "",
        image = json["image"] ?? "",
        owner = json["owner"] ?? false,
        customer = json["customer"] ?? false;
}
