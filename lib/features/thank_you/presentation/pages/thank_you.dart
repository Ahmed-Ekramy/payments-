import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_s/core/utils/images.dart';

import '../widgets/thank_you_card.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                AppImages.arrow,
                width: 30.w,
                height: 0.h,
              )),
        ),
          body: Padding(
        padding: EdgeInsets.only(
            right: 20.0.w, left: 20.0.w, top: 40.h, bottom: 61.h),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const ThankYouCard(),
            const Positioned(
              left: -17,
              bottom: 170,
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            const Positioned(
              right: -17,
              bottom: 170,
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              top: -50,
              left: 0,
              right: 0,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: const Color(0xFFD9D9D9),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF34A853),
                    shape: OvalBorder(),
                  ),
                  child:Image.asset(AppImages.ok) ,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
