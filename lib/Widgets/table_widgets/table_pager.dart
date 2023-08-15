import 'package:custom_widgets/custom_widgets.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dashboard/Core/Language/locales.dart';
import 'package:my_dashboard/Widgets/table_widgets/generic_data_source.dart';
import 'package:provider/provider.dart';

import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';
import '../../Utilities/theme_style_helper.dart';
import '../../core/Language/app_languages.dart';
import '../../generated/assets.dart';

class TablePager extends StatelessWidget {
  final Pagination pagination;

  const TablePager({super.key, required this.pagination});

  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context);
    // skip this build pass
    // if (!widget.controller.isAttached) return const SizedBox();
    return Container(
      alignment: Alignment.center,
      width: 160.w,
      height: 36.h,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: pagination.goToPreviousPage,
              child: SvgPicture.asset(
                  appLan.appLang.name == "ar"
                      ? Assets.imagesSvgIconsArrowCircleRight
                      : Assets.imagesSvgIconsArrowCircleLeft,
                  height: 20.r,
                  width: 20.r,
                  color: ThemeClass.darkGreyColor)),
          8.w.widthBox,
          Container(
            alignment: Alignment.center,
            height: 24.r,
            width: 24.r,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: ThemeClass.accentColor),
            child: AppTextWidget(
                text: "${pagination.currentPageNumber}",
                style: ThemeStyleHelper.s12RegTextStyle
                    .copyWith(fontSize: 10.sp, color: Colors.white)),
          ),
          8.0.widthBox,
          AppTextWidget(
              text: Strings.from.tr,
              style:
                  ThemeStyleHelper.s12RegTextStyle.copyWith(fontSize: 11.sp)),
          8.0.widthBox,
          Container(
            alignment: Alignment.center,
            height: 24.r,
            width: 24.r,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: ThemeClass.darkGreyColor),
                color: Colors.transparent),
            child: AppTextWidget(
                text: "${pagination.totalPagesNumber}",
                style:
                    ThemeStyleHelper.s12RegTextStyle.copyWith(fontSize: 10.sp)),
          ),
          8.0.widthBox,
          InkWell(
              onTap: pagination.goToNextPage,
              child: SvgPicture.asset(
                  appLan.appLang.name == "ar"
                      ? Assets.imagesSvgIconsArrowCircleLeft
                      : Assets.imagesSvgIconsArrowCircleRight,
                  height: 20.r,
                  width: 20.r,
                  color: ThemeClass.darkGreyColor)),
        ],
      ),
    );
  }
}
