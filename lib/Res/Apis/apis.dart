import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  // FIREBASE FIRESTORE
  final _firestore = FirebaseFirestore.instance;

  // ALL COLLECTION REFERENCE
  CollectionReference<Map<String, dynamic>> get userReference =>
      _firestore.collection("customer"); // CUSTOMER REFERENCE
  CollectionReference<Map<String, dynamic>> get carReference =>
      _firestore.collection("Vehicle"); // VEHICLE(CAR) REFERENCE
  CollectionReference<Map<String, dynamic>> get wishListReference =>
      _firestore.collection("wishList"); // WISHLIST REFERENCE
  CollectionReference<Map<String, dynamic>> get bookingReference =>
      _firestore.collection("bookings"); // BOOKING REFERENCE
  CollectionReference<Map<String, dynamic>> get addressReference =>
      _firestore.collection("customerAddress"); // ADDRESS REFERENCE

  // ALL DOCUMENT REFERENCE
  DocumentReference<Map<String, dynamic>> userDocument(String id) =>
      userReference.doc(id); // CUSTOMER DOCUMENT
  DocumentReference<Map<String, dynamic>> carDocument(String id) =>
      carReference.doc(id); // VEHICLE(CAR) DOCUMENT
  DocumentReference<Map<String, dynamic>> wishListDocument(String id) =>
      wishListReference.doc(id); // WISHLIST DOCUMENT
  DocumentReference<Map<String, dynamic>> bookingDocument(String id) =>
      bookingReference.doc(id); // BOOKING DOCUMENT
  DocumentReference<Map<String, dynamic>> addressDocument(String id) =>
      addressReference.doc(id); // ADDRESS DOCUMENT
}
