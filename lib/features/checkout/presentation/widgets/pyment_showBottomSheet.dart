import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/images.dart';
import '../../../../core/utils/text_style.dart';
import '../../../detail/presentation/widgets/payItems.dart';

class pymentshowBottomSheet extends StatefulWidget {
  const pymentshowBottomSheet({Key? key}) : super(key: key);

  @override
  State<pymentshowBottomSheet> createState() => _pymentshowBottomSheetState();
}

class _pymentshowBottomSheetState extends State<pymentshowBottomSheet> {
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
              physics: BouncingScrollPhysics(),
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
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.h),
          child: Container(
            width: 350.w,
            height: 60.h,
            decoration: ShapeDecoration(
              color: Color(0xFF34A853),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Center(
                child: Text(
              "Continue",
              style: inter22W500(),
            )),
          ),
        ),
      ],
    );
  }
}
