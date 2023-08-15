import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../Utilities/strings.dart';
import '../Utilities/theme_helper.dart';
import '../Utilities/theme_style_helper.dart';
import '../generated/assets.dart';

class CustomButtonWidget extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final double? width, height, borderRadiusValue;
  final Color? backGroundColor;
  final TextStyle? textStyle;
  final Function() onTap;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  const CustomButtonWidget(
      {Key? key,
      required this.title,
      this.width,
      this.height,
      required this.onTap,
      this.backGroundColor,
      this.borderRadiusValue,
      this.borderColor,
      this.textStyle,
      this.borderRadius})
      : titleWidget = null,
        super(key: key);
  const CustomButtonWidget.customWidget(
      {Key? key,
      this.width,
      this.height,
      required this.onTap,
      this.backGroundColor,
      this.borderRadiusValue,
      this.borderColor,
      required this.titleWidget,
      this.borderRadius})
      : title = null,
        textStyle = null,
        super(key: key);

  const CustomButtonWidget.outline(
      {Key? key,
      required this.title,
      this.width,
      this.height,
      required this.onTap,
      this.borderRadiusValue,
      this.borderColor,
      this.textStyle,
      this.borderRadius})
      : titleWidget = null,
        backGroundColor = Colors.transparent,
        super(key: key);
  const CustomButtonWidget.customWidgetOutline(
      {Key? key,
      this.width,
      this.height,
      required this.onTap,
      this.borderRadiusValue,
      this.borderColor,
      required this.titleWidget,
      this.borderRadius})
      : title = null,
        textStyle = null,
        backGroundColor = Colors.transparent,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: ThemeClass.accentColor.withOpacity(0.5),
      splashColor: ThemeClass.accentColor.withOpacity(0.5),
      borderRadius:
          borderRadius ?? BorderRadius.circular(borderRadiusValue ?? 50.r),
      child: Container(
        width: width ?? 128.w,
        height: height ?? 56.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backGroundColor ?? ThemeClass.primaryColor,
            borderRadius: borderRadius ??
                BorderRadius.circular(borderRadiusValue ?? 50.r),
            border: Border.all(
                width: 1.w, color: borderColor ?? ThemeClass.primaryColor)),
        child: titleWidget ??
            Text(
              title ?? '',
              style: textStyle ??
                  ThemeStyleHelper.s16RegTextStyle.copyWith(
                      color: backGroundColor == Colors.transparent
                          ? ThemeClass.primaryColor
                          : Colors.white),
            ),
      ),
    );
  }

  static Widget get saveWidget => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.imagesSvgIconsFolder2,
            width: 20.w,
            height: 20.h,
          ),
          14.w.widthBox,
          Text(
            Strings.save.tr,
            style:
                ThemeStyleHelper.s16RegTextStyle.copyWith(color: Colors.white),
          ),
        ],
      );

  static Widget get addWidget => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.imagesSvgIconsAdd,
            width: 20.r,
            height: 20.r,
            color: Colors.white,
          ),
          14.w.widthBox,
          Text(
            Strings.add.tr,
            style:
                ThemeStyleHelper.s16RegTextStyle.copyWith(color: Colors.white),
          ),
        ],
      );

  // static Widget editWidget = Row(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     Icon(
  //       Icons.edit,
  //       color: Colors.white,
  //       size: 20.r,
  //     ),
  //     14.w.widthBox,
  //     Text(
  //       Strings.editing.tr,
  //       style: ThemeStyleHelper.s16RegTextStyle
  //           .copyWith(color: Colors.white),
  //     ),
  //   ],
  // );
}
