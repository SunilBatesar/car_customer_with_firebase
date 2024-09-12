// ignore_for_file: avoid_print

import 'dart:math';

import 'package:car_booking_customer/Models/car_model.dart';

class AppFunctions {
  //Generate random id **//
  static generateId({int length = 20}) {
    String characters = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    String id = "";

    String randomChoice() {
      Random random = Random();
      int index = random.nextInt(characters.length);
      print(index);
      return characters[index];
    }

    for (var i = 0; i < length; i++) {
      String character = randomChoice();
      id += character;
    }
    print("Id = $id");
    return id;
  }

  // LESS THEN PRICE FILTER
 static CreatePackageModel findLessPrice(List<CreatePackageModel> model) {
    List<CreatePackageModel> bestpackageList = model;
    bestpackageList.sort((a, b) => a.ammount!.compareTo(b.ammount!));
    return bestpackageList.first;
  }
}
