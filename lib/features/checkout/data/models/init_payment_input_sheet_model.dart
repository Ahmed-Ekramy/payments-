class InitPaymentInputMode{
   String paymentIntentClientSecret;
   String customerEphemeralKeySecret;
   String customerId;

   InitPaymentInputMode(
      {required this.paymentIntentClientSecret,
      required this.customerEphemeralKeySecret,
      required this.customerId});
}