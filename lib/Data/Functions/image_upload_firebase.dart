import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class ImageUploadFirebase {
  // FIREBASE STORAGE
  final _store = FirebaseStorage.instance;

  // SET IMAGE
  Future setImage(File file) async {
    try {
      String id =
          DateTime.now().microsecond.toString() + file.path.split("/").last;
      final referecne = _store.ref().child("media/$id");
      await referecne.putFile(file);
      return await referecne.getDownloadURL();
    } catch (e) {
      print("--------");
      print(e.toString());
      print("--------");
    }
  }

  // UPDATE IMAGE
  Future updateImage({required String imageURL, required File file}) async {
    try {
      final reference = _store.refFromURL(imageURL);
      await reference.putFile(file);
      return await reference.getDownloadURL();
    } catch (e) {
      print("--------");
      print(e.toString());
      print("--------");
    }
  }
}
