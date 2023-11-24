import 'package:dio/dio.dart';
import 'package:payment_s/core/utils/api_key.dart';

import '../../features/checkout/data/models/PymentIntentModel.dart';
import '../../features/checkout/data/models/payment_input_model.dart';
import 'constant.dart';

class StripeServices {
  Dio dio = Dio();
  Future<PaymentIntentModel> createPaymentIntent(
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
}
