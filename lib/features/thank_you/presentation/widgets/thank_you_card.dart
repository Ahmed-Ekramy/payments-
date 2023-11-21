import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pyment/core/utils/images.dart';
import 'package:pyment/core/utils/text_style.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 672,
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 66.h,
          ),
          Text(
            "Thank you!",
            style: inter25W500(),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "Your transaction was successful",
            style: inter20W400(),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 42.0.h, bottom: 8.h, left: 22.w, right: 22.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Date",
                      style: inter18W400(),
                    ),
                    Spacer(),
                    Text(
                      "0",
                      style: inter18W600(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Time",
                      style: inter18W400(),
                    ),
                    Spacer(),
                    Text(
                      "\$0",
                      style: inter18W600(),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "To",
                      style: inter18W400(),
                    ),
                    Spacer(),
                    Text(
                      "\$0",
                      style: inter18W600(),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: const Color(0xFF959595),
            thickness: 2,
            indent: 20.w,
            endIndent: 20.w,
          ),
          Padding(
            padding: EdgeInsets.only( bottom: 8.h, left: 22.w, right: 22.w),
            child: Row(
              children: [
                Text(
                  "Total",
                  style: inter24W600(),
                ),
                Spacer(),
                Text(
                  "0",
                  style: inter24W600(),
                )
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            width: 305.w,
            height: 73.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Image.asset(AppImages.logo),
                  Text.rich(

                    TextSpan(

                      children: [
                        const TextSpan(
                          text: 'Credit Card ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: 'Mastercard **78',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.699999988079071),
                            fontSize: 16,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  )
            ]),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0.h),
            child: Row(
                children: List.generate(
              25,
              (index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                child: Container(
                  width: 7,
                  height: 2,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2.w,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xFFB7B7B7),
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 22.0.w,vertical: 58.h),
            child: Row(
              children: [
              Icon(FontAwesomeIcons.barcode,size: 60),
              // SizedBox(width: 50.w),
                Spacer(),
              Container(
                width: 113,
                height: 58,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.50, color: Color(0xFF34A853)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child:  Center(
                  child: Text(
                    'PAID',
                    textAlign: TextAlign.center,
                    style:inter24W600().copyWith(color: Color(0xFF34A853))
                  ),
                ),
              )
            ],),
          )
        ],
      ),
    );
  }
}
