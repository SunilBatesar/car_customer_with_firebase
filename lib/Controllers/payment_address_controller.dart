import 'package:car_booking_customer/Utils/Enums/enums.dart';
import 'package:get/get.dart';

class PaymentAddressController extends GetxController {
  final Rx<PaymentState> _paymentStateValue = PaymentState.CAR.obs;
  PaymentState get paymentStateValue => _paymentStateValue.value;

  setpaymentStateValue(PaymentState state) {
    _paymentStateValue.value = state;
  }
}
