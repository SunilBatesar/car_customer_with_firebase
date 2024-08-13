import 'package:car_booking_customer/Utils/Enums/enums.dart';

class DataResponse<T> {
  DataState? state;
  T? data;
  String? message;
  DataResponse({this.state, this.data, this.message});
  DataResponse.pending() : state = DataState.PENDING;
  DataResponse.isloading() : state = DataState.ISLOADING;
  DataResponse.complete(this.data) : state = DataState.COMPLETE;
  DataResponse.error(this.message) : state = DataState.ERROR;
  @override
  String toString() {
    return "State : $state \n Data : $data \n Error : $message";
  }
}
