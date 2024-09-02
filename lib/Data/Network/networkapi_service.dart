import 'dart:convert';

import 'package:car_booking_customer/Data/Network/baseapi_service.dart';
import 'package:car_booking_customer/Data/app_exceptions.dart';
import 'package:car_booking_customer/Models/firebase_response_model.dart';
import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class NetworkapiService extends BaseapiService {
  final _auth = FirebaseAuth.instance;
  @override
  Future authenticate(
      {required AuthState state, Map<String, dynamic>? json}) async {
    String email = json!["email"] ?? "";
    String password = json["password"] ?? "";
    try {
      if (state == AuthState.SIGNUP) {
        UserCredential usercredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        return usercredential;
      } else if (state == AuthState.LOGIN) {
        UserCredential usercredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        return usercredential;
      } else if (state == AuthState.LOGOUT) {
        await _auth.signOut();
      }
    } catch (e) {
      rethrow;
    }
  }

  // POST DATA
  @override
  Future post(path, Map<String, dynamic> data) async {
    Future<void>? response;
    try {
      if (path is CollectionReference) {
        response = path.add(data);
      } else {
        
        response = (path as DocumentReference).set(data);
      }
    } catch (e) {
      rethrow;
    }
    return response;
  }

  //  GET DATA
  @override
  Future<dynamic> get(path) async {
    try {
      if (path is CollectionReference) {
        return await getDataCollectionRef(path);
      } else if (path is Query<Map<String, dynamic>>) {
        return await getDataQuery(path);
      } else {
        return await getDataDocoment(path as DocumentReference);
      }
    } catch (e) {
      rethrow;
    }
  }
}

// Return Response
dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      return jsonDecode(response.body);
    case 201:
      return jsonDecode(response.body);
    case 400:
      throw BadRequestException(response.body.toString());
    case 404:
      throw BadRequestException(response.body.toString());
    default:
      throw FetchDataException(
          "Error communicating with server \n with status code : ${response.body.toString()}");
  }
}

// GET DATA FROM COLLECTION
Future<List<FirebaseResponseModel>> getDataCollectionRef(
    CollectionReference reff) async {
  List<FirebaseResponseModel> data = [];
  try {
    final snapshot = await reff.get();
    data = snapshot.docs
        .map((e) => FirebaseResponseModel.fromResponse(e))
        .toList();
  } catch (e) {
    rethrow;
  }
  return data;
}

// GET DATA FROM DOCOMENT
Future<FirebaseResponseModel> getDataDocoment(DocumentReference reff) async {
  FirebaseResponseModel? data;
  try {
    final snapshot = await reff.get();
    data = FirebaseResponseModel.fromResponse(snapshot);
  } catch (e) {
    rethrow;
  }
  return data;
}

// GET DATA FROM QUERY
Future<List<FirebaseResponseModel>> getDataQuery(Query reff) async {
  List<FirebaseResponseModel> data = [];
  try {
    final snapshot = await reff.get();
    data = snapshot.docs
        .map((e) => FirebaseResponseModel.fromResponse(e))
        .toList();
  } catch (e) {
    rethrow;
  }
  return data;
}
