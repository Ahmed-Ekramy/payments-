import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_s/core/utils/api_key.dart';
import '../../features/checkout/data/models/PymentIntentModel.dart';
import '../../features/checkout/data/models/payment_input_model.dart';
import 'constant.dart';

class StripeServices {
 static Dio dio = Dio();

  static Future<PaymentIntentModel> createPaymentIntent(
      PaymentInputModel paymentInputModel) async {
    var response = await dio.post(Constant.url,
        data: paymentInputModel.toJson(),
        options: Options(
          contentType: "application/x-www-form-urlencoded",
          headers: {"Authorization": "Bearer ${ApiKey.secretKey}"},
        ));
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  static Future initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // customFlow: false,
        merchantDisplayName: 'Ekramy',
        paymentIntentClientSecret: paymentIntentClientSecret,
        // Customer keys
        // customerEphemeralKeySecret: data['ephemeralKey'],
        // customerId: data['customer'],
        // testEnv: true,
        // applePay: true,
        // googlePay: true,
        // style: ThemeMode.dark,
        // merchantCountryCode: 'DE',
      ),
    );
  }

  static Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  static Future makePayment(
      {required PaymentInputModel paymentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
