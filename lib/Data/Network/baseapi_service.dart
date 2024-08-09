import 'package:car_booking_customer/Utils/Enums/enums.dart';

abstract class BaseapiService {
  Future<dynamic> authenticate(AuthState state, {Map<String, dynamic>? json});
  Future<dynamic> post(dynamic path, Map<String, dynamic> data);
}
