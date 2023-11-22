import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PayItems extends StatelessWidget {
  PayItems({super.key, required this.x,required this.image});
  bool x;
String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 20.0.w,
      ),
      child: AnimatedContainer(
        width: 103,
        height: 62,
        duration: Duration(milliseconds: 300),
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.50, color: x ? Color(0xFF34A853) : Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: x ? Color(0xFF34A853) : Colors.grey,
                blurRadius: 4,
              ),
            ]),
        child: Image.asset(image,fit: BoxFit.scaleDown,),
      ),
    );
  }
}
