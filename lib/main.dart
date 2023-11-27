import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_s/core/utils/api_key.dart';

import 'app.dart';
import 'core/utils/observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  Stripe.publishableKey=ApiKey.publishKey;

  runApp( const CheckoutApp());
}




