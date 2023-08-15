import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../Utilities/strings.dart';
import '../Utilities/theme_helper.dart';
import '../Utilities/theme_style_helper.dart';
import '../generated/assets.dart';
import 'custom_textfield_widget.dart';

class MainScreenWidget extends StatelessWidget {
  final String title;
  final TextEditingController? searchController;
  final Widget? leadingWidget;
  final Widget content;
  const MainScreenWidget(
      {super.key,
      required this.title,
      this.searchController,
      required this.content,
      this.leadingWidget});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          32.h.heightBox,
          Row(
            children: [
              Text(
                title,
                style: ThemeStyleHelper.s32RegTextStyle
                    .copyWith(color: ThemeClass.primaryColor),
              ),
              const Spacer(),
              if (searchController != null)
                CustomTextFieldWidget(
                  controller: searchController,
                  backGroundColor: Colors.white,
                  hint: Strings.search.tr,
                  hintStyle: ThemeStyleHelper.s16RegTextStyle,
                  width: 360.w,
                  suffixIcon: SvgPicture.asset(
                    Assets.imagesSvgIconsSearchNormal1,
                    width: 20.r,
                    height: 20.r,
                    color: ThemeClass.primaryColor,
                  ),
                  style: ThemeStyleHelper.s16RegTextStyle
                      .copyWith(color: Colors.black),
                ),
              24.0.w.widthBox,
              leadingWidget ?? const SizedBox(),
            ],
          ).addPaddingSymmetric(horizontal: 40.w, vertical: 0),
          16.h.heightBox,
          content.addPaddingHorizontal(40.w).expand,
          //table
        ],
      ),
    );
  }
}
