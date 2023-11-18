import 'package:flutter/material.dart';
import '../../../../config/Routes/routes.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/utils/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  InkWell(
            onTap: () {

            },
            child: Image.asset(AppImages.arrow,width: 30.w,height: 0.h,)),
        elevation: 0,
        centerTitle: true,
        title: Text(
          " My Cart",
          style: inter25W500(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        child: Column(children: [
          Expanded(child: Image.asset(AppImages.cart)),
          Row(
            children: [
              Text(
                "Order Subtotal",
                style: inter18W400(),
              ),
              Spacer(),
              Text(
                "\$42.97",
                style: inter18W400(),
              )
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              Text(
                "Discount",
                style: inter18W400(),
              ),
              Spacer(),
              Text(
                "\$0",
                style: inter18W400(),
              )
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Row(
            children: [
              Text(
                "Shipping",
                style: inter18W400(),
              ),
              Spacer(),
              Text(
                "\$8",
                style: inter18W400(),
              )
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
          const Divider(color: Colors.grey,thickness: 2,endIndent: 15,indent: 15,),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Text(
                "Total",
                style: inter24W600(),
              ),
              Spacer(),
              Text(
                "\$50.97",
                style: inter24W600(),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.details);

            },
            child: Container(
              width: 350.w,
              height: 60.h,
              decoration: ShapeDecoration(
                color: Color(0xFF34A853),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),

              child: Center(child: Text("Complete Payment",style: inter22W500(),)),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
        ]),
      ),
    );
  }
}
