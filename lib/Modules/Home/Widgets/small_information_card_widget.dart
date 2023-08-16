import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Utilities/theme_style_helper.dart';

class SmallInformationCardWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final String value;

  const SmallInformationCardWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 296.w,
      height: 128.h,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 72.r,
              height: 72.r,
            ),
            16.w.widthBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                4.0.h.heightBox,
                Text(
                  value,
                  style: ThemeStyleHelper.s22RegTextStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1.2),
                ),
                Text(
                  title,
                  style: ThemeStyleHelper.s16RegTextStyle
                      .copyWith(color: Colors.black),
                ),
              ],
            ),
          ],
        ).addPaddingHorizontal(24.w),
      ),
    );
  }
}
