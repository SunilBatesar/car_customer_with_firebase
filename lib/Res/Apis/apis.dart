import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  // FIREBASE FIRESTORE
  final _firestore = FirebaseFirestore.instance;

  // ALL COLLECTION REFERENCE
  // USER REFERENCE
  CollectionReference<Map<String, dynamic>> get userReference =>
      _firestore.collection("customer");
  CollectionReference<Map<String, dynamic>> get carReference =>
      _firestore.collection("Vehicle");
  CollectionReference<Map<String, dynamic>> get wishListReference =>
      _firestore.collection("wishList");

  // ALL DOCUMENT REFERENCE
  // USER DOC REFERENCE
  DocumentReference<Map<String, dynamic>> userDocument(String id) =>
      userReference.doc(id);
  DocumentReference<Map<String, dynamic>> carDocument(String id) =>
      carReference.doc(id);
  DocumentReference<Map<String, dynamic>> wishListDocument(String id) =>
      wishListReference.doc(id);
}
