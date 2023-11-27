import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/payment_input_model.dart';
import '../../data/repositories/checkout_repo_imp.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepImp) : super(PaymentInitial());
  final CheckoutRepImp checkoutRepImp;

  static PaymentCubit get(context) => BlocProvider.of(context);

  makePayment(PaymentInputModel paymentInputModel) async {
    emit(PaymentLoadingState());
    var result = await checkoutRepImp.makePayment(
        paymentInputModel: paymentInputModel);
    result.fold((l) {
      emit(PaymentFailureState(l.message));
      print(l.message);
    }, (r) =>
        emit(PaymentSuccessState()));
  }
}
