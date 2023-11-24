import 'package:dartz/dartz.dart';
import 'package:payment_s/core/error/failure.dart';

import '../models/payment_input_model.dart';

 abstract class CheckoutRepo {
  Future<Either<Failures, void>> makePayment( {required PaymentInputModel paymentInputModel} );
}
