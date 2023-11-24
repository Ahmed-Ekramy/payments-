import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_s/core/error/failure.dart';
import 'package:payment_s/core/utils/stripe_services.dart';
import 'package:payment_s/features/checkout/data/repositories/checkout_repo.dart';
import '../models/payment_input_model.dart';

class CheckoutRepImp extends CheckoutRepo {
  @override
  Future<Either<Failures, void>> makePayment(
      {required PaymentInputModel paymentInputModel}) async {
    try{
      await StripeServices.makePayment(paymentInputModel: paymentInputModel);
      return right(null);
    }catch(e){
      if (e is DioException) {
        return Left(ServerFailure.fromDiorError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
  }