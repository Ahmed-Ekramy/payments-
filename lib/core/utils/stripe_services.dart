import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_s/core/utils/api_key.dart';
import 'package:payment_s/features/checkout/data/models/ephmeral_model.dart';
import '../../features/checkout/data/models/PymentIntentModel.dart';
import '../../features/checkout/data/models/init_payment_input_sheet_model.dart';
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

  static Future<EphemeralKeysModel> createEphemeralKey(
      String customerId) async {
    var response = await dio.post(Constant.ephemeralKey,
        data: {"customer": customerId},
        options: Options(
          contentType: "application/x-www-form-urlencoded",
          headers: {
            "Authorization": "Bearer ${ApiKey.secretKey}",
            "Stripe-Version": "2023-10-16"
          },
        ));
    EphemeralKeysModel ephemeralKeysModel =
        EphemeralKeysModel.fromJson(response.data);
    return ephemeralKeysModel;
  }

  static Future initPaymentSheet(
      InitPaymentInputMode initPaymentInputMode) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Ekramy',
        paymentIntentClientSecret:
            initPaymentInputMode.paymentIntentClientSecret,
        customerEphemeralKeySecret:
            initPaymentInputMode.customerEphemeralKeySecret,
        customerId: initPaymentInputMode.customerId,
      ),
    );
  }

  static Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  static Future makePayment(
      {required PaymentInputModel paymentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentInputModel);
    var ephemeralKeyModel =
        await createEphemeralKey(paymentInputModel.customerId);
    var initPaymentInputMode = InitPaymentInputMode(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        customerEphemeralKeySecret: ephemeralKeyModel.secret!,
        customerId: paymentInputModel.customerId);
    await initPaymentSheet(initPaymentInputMode);
    await displayPaymentSheet();
  }
}
