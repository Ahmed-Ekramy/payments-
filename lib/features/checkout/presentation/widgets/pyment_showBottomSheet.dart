import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_s/core/utils/api_key.dart';
import 'package:payment_s/features/checkout/data/models/amount_model.dart';
import 'package:payment_s/features/checkout/data/models/item_list_model.dart';
import 'package:payment_s/features/thank_you/presentation/pages/thank_you.dart';
import '../../../../core/utils/images.dart';
import '../../../../core/utils/text_style.dart';
import '../../../detail/presentation/widgets/payItems.dart';
import '../../data/models/payment_input_model.dart';
import '../manager/payment_cubit.dart';

class PaymentShowBottomSheet extends StatefulWidget {
  const PaymentShowBottomSheet({Key? key}) : super(key: key);

  @override
  State<PaymentShowBottomSheet> createState() => _PaymentShowBottomSheetState();
}

class _PaymentShowBottomSheetState extends State<PaymentShowBottomSheet> {
  int actIndex = 0;
  List<String> imagesList = [AppImages.sVGRepo, AppImages.pal, AppImages.apple];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: 18.0.h, bottom: 12.h, left: 20.w, right: 20.w),
          child: SizedBox(
            height: 62,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    actIndex = index;
                    setState(
                      () {},
                    );
                  },
                  child:
                      PayItems(x: actIndex == index, image: imagesList[index])),
              itemCount: imagesList.length,
            ),
          ),
        ),
        BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
            if (state is PaymentSuccessState) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThankYou(),
                  ));
            }
            if (state is PaymentFailureState) {
              Navigator.pop(context);
              SnackBar snackBar = SnackBar(content: Text(state.error));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            return InkWell(
              onTap: () {
                var amount = AmountModel(
                    total: "100",
                    currency: "usd",
                    details: Details(
                      shipping: "0",
                      shippingDiscount: 0,
                      subtotal: "100",
                    ));
                List<Items> order = [
                  Items(
                    currency: "usd",
                    name: "APPLE",
                    price: "4",
                    quantity: 10,
                  ),
                  Items(
                    currency: "usd",
                    name: "APPLE",
                    price: "5",
                    quantity: 12,
                  ),
                ];
                var itemList = ItemListModel(items: order);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId:ApiKey.clientId,
                    secretKey: ApiKey.payPalSecretKey,
                    transactions: [
                      {
                        "amount": amount.toJson(),
                        "description": "The payment transaction description.",
                        "item_list": itemList.toJson()
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      log("onSuccess: $params");
                      Navigator.pop(context);
                    },
                    onError: (error) {
                      log("onError: $error");
                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                      Navigator.pop(context);
                    },
                  ),
                ));
                // PaymentInputModel paymentInputModel = PaymentInputModel(
                //     amount: "100",
                //     currency: "usd",
                //     customerId: "cus_P5BXQvbJFcc4QA");
                // PaymentCubit.get(context).makePayment(paymentInputModel);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.h),
                child: Container(
                  width: 350.w,
                  height: 60.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF34A853),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                      child: state is PaymentLoadingState
                          ? const Center(child: CircularProgressIndicator())
                          : Text(
                              "Continue",
                              style: inter22W500(),
                            )),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
