import 'dart:async';

import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:my_dashboard/Core/Language/locales.dart';
import 'package:provider/provider.dart';

import '../../Core/Language/app_languages.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';
import '../../Utilities/theme_style_helper.dart';
import '../../generated/assets.dart';
import '../custom_button_widget.dart';
import 'menu_bar_widget.dart';

class DashboardMenuLayout extends StatefulWidget {
  final String menuBarRoute;
  final Widget child;
  final Function() onRefresh;
  // final Pagination? pagination;
  const DashboardMenuLayout(
      {Key? key,
      required this.child,
      required this.menuBarRoute,
      required this.onRefresh}) //, this.pagination})
      : super(key: key);

  @override
  State<DashboardMenuLayout> createState() => _DashboardMenuLayoutState();
}

class _DashboardMenuLayoutState extends State<DashboardMenuLayout> {
  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context, listen: false);
    return Scaffold(
      backgroundColor: ThemeClass.backGroundColor,
      body: Padding(
        // padding: EdgeInsets.only(right: 80.r, left: 80.r,top: 80.r, bottom: widget.pagination !=null?20.r:80.r),
        padding:
            EdgeInsets.only(right: 80.r, left: 80.r, top: 80.r, bottom: 80.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuBarWidget(
              menuBar: widget.menuBarRoute,
            ),
            20.r.widthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 95.h,
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: Strings.hello.tr,
                            style: ThemeStyleHelper.s24RegTextStyle
                                .copyWith(color: ThemeClass.darkGreyColor),
                            children: [
                              TextSpan(
                                text: ' احمد',
                                style: ThemeStyleHelper.s24RegTextStyle
                                    .copyWith(color: ThemeClass.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          intl.DateFormat('EEEE d MMMM', appLan.appLang.name)
                              .format(
                            DateTime.now(),
                          ),
                          style: ThemeStyleHelper.s16RegTextStyle
                              .copyWith(color: ThemeClass.primaryColor),
                        ),
                        16.w.widthBox,
                        Text(
                          "30 °C", // SharedPref.getTemperature() ?? "-",
                          style: ThemeStyleHelper.s16RegTextStyle
                              .copyWith(color: ThemeClass.primaryColor),
                          textDirection: TextDirection.ltr,
                        ),
                        24.0.w.widthBox,
                        InkWell(
                          onTap: () async {
                            await appLan.changeLanguage();
                            await Future.delayed(
                                const Duration(milliseconds: 50));
                            setState(() {});
                            widget.onRefresh();
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.imagesSvgIconsGlobal,
                                width: 20.r,
                                height: 20.r,
                                color: ThemeClass.primaryColor,
                              ),
                              8.0.widthBox,
                              Text(Strings.languageValue.tr,
                                  style: ThemeStyleHelper.s14SemiBoldTextStyle
                                      .copyWith(
                                    color: ThemeClass.primaryColor,
                                  )),
                            ],
                          ),
                        ),
                        24.0.w.widthBox,
                        CustomButtonWidget.outline(
                          onTap: () {},
                          title: Strings.logout.tr,
                        ),
                      ],
                    ).addPaddingSymmetric(horizontal: 40.w, vertical: 0),
                  ),
                ),
                20.0.r.heightBox,
                widget.child.expand,

                // if(widget.pagination !=null) 20.r.heightBox,
                // if(widget.pagination !=null) Align(
                //   alignment: AlignmentDirectional.centerEnd,
                //   child: TablePager(pagination: widget.pagination!)),
              ],
            ).expand,
          ],
        ),
      ),
    );
  }
}
