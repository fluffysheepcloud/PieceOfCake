

import 'package:stripe_payment/stripe_payment.dart';

class PaymentService{
  final double total;
  final String url;

  PaymentService(
  {
    this.total = 200.0,
    this.url = "",
  });

  static init(){
    StripePayment.setOptions(
      StripeOptions(publishableKey:
      'pk_test_51KgGknH8kaVlhChJ9Vw3R9rlUgkgXXjnUhMFugLo6vTyN53QFqT8wKQCdPDQ2QkNHh7aBhUcBrHaEHkyPQ3i5UJF00Kh1FPo1g',
      androidPayMode: 'test',
      merchantId:'test'),
    );
  }

  Future<PaymentMethod?> createPaymentMethod() async {
    //print('The total is: $total ');
    PaymentMethod paymentMethod =
    await StripePayment.paymentRequestWithCardForm(
    CardFormPaymentRequest(),
    );
    return paymentMethod;
  }

  Future<void> processPayment( PaymentMethod paymentMethod) async {}

}