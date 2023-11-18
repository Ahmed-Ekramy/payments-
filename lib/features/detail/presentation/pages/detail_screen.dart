import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/images.dart';
import '../../../../core/utils/text_style.dart';
import '../widgets/payItems.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key}) : super(key: key);


  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> imagesList = [AppImages.sVGRepo, AppImages.pal, AppImages.apple];
  int actIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              AppImages.arrow,
              width: 30.w,
              height: 0.h,
            )),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Payment Details',
          style: inter25W500(),
        ),
      ),
      body: Padding(
        padding:
        EdgeInsets.only(top: 18.0.h, bottom: 12.h, left: 20.w, right: 20.w),
        child: Column(children: [
          SizedBox(
            height: 62,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  GestureDetector(
                      onTap: () {
                        actIndex = index;
                        setState(() {},);
                      },

                      child: PayItems(
                          x: actIndex == index, image: imagesList[index])),
              itemCount: imagesList.length,
            ),
          ),
          CustomCreditCard(),
        ]),
      ),
    );
  }
}

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({Key? key}) : super(key: key);

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = "",
      expiryDate = "",
      cardHolderName = "",
      cvvCode = "";
bool showBackView=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            onCreditCardWidgetChange: (value) {

            },)
      ],
    );
  }
}



