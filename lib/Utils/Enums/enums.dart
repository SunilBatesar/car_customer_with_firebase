// ignore_for_file: constant_identifier_names

/// AUTH STATE
enum AuthState { LOGIN, SIGNUP, LOGOUT }

/// PAYMENT STATE
enum PaymentState { CAR, ADDRESS, PAYMENT }

/// DATA STATE
enum DataState { PENDING, COMPLETE, ERROR, ISLOADING }

/// POST DATA REQUEST TYPE
enum PostDataREquestType { ADD }

/// PACKAGE TYPE (CAR PRICE TYPES)
enum PackageType { HOUR, DAY, WEEK }

/// BOOKING STATE
enum BookingState { REQUEST, PENDING, REJECTED, COMPLETE, ACCEPT }
