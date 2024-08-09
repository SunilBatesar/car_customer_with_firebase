import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  // FIREBASE FIRESTORE
  final _firestore = FirebaseFirestore.instance;

  // ALL COLLECTION REFERENCE
  // USER REFERENCE
  CollectionReference<Map<String, dynamic>> get userReference =>
      _firestore.collection("customer");

  // ALL DOCUMENT REFERENCE
  // USER DOC REFERENCE
  DocumentReference<Map<String, dynamic>> userDocument(String id) =>
      userReference.doc(id);
}
