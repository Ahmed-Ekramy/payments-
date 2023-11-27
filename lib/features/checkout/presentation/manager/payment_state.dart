part of 'payment_cubit.dart';

abstract class PaymentState {}
class PaymentInitial extends PaymentState {}

class PaymentLoadingState extends PaymentState {}
class PaymentSuccessState extends PaymentState {}
class PaymentFailureState extends PaymentState {
  String error;
  PaymentFailureState(this.error);
}
