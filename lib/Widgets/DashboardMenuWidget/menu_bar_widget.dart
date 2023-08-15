import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../Models/menu_model.dart';
import '../../Utilities/strings.dart';
import '../../Utilities/theme_helper.dart';
import '../../Utilities/theme_style_helper.dart';

class MenuBarWidget extends StatelessWidget {
  final String menuBar;
  const MenuBarWidget({Key? key, required this.menuBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      height: 920.h,
      child: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Menu Header
            Padding(
              padding: EdgeInsets.only(top: 34.h),
              child: Row(
                children: [
                  24.0.w.widthBox,
                  SizedBox(
                    width: 65.w,
                    height: 65.w,
                    child: const CircleAvatar(
                      backgroundColor: ThemeClass.primaryColor,
                    ),
                  ),
                  14.0.w.widthBox,
                  Text(
                    'اسم الشركة',
                    style: ThemeStyleHelper.s22RegTextStyle
                        .copyWith(color: ThemeClass.primaryColor, height: 1.0),
                    textAlign: TextAlign.center,
                  ).widthBox(159.w),
                ],
              ),
            ).center,
            16.0.h.heightBox,
            Divider(
              thickness: 1,
              color: ThemeClass.darkGreyColor,
              endIndent: 24.w,
              indent: 24.w,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.0.h.heightBox,
                  ...menuList.map((e) {
                    return MenuWidget(
                      menuModel: e
                        ..isSelected = menuBar.contains(e.menuBarRoute.name),
                      onTap: () => context.goNamed(e.menuBarRoute.name),
                    );
                  }).toList(),
                ],
              ),
            ).expand,
          ],
        ),
      ),
    );
  }
}

final List<MenuModel> menuList = [
  MenuModel(
    title: Strings.home,
    imagePath: "assets/svgIcons/chart-square.svg",
    menuBarRoute: MenuBarRoutes.home,
  ),
  MenuModel(
    title: Strings.products,
    imagePath: "assets/svgIcons/vuesax-linear-box.svg",
    menuBarRoute: MenuBarRoutes.products,
  ),
  MenuModel(
    title: Strings.offers,
    imagePath: "assets/svgIcons/vuesax-linear-receipt-disscount.svg",
    menuBarRoute: MenuBarRoutes.offers,
  ),
  MenuModel(
    title: Strings.album,
    imagePath: "assets/svgIcons/vuesax-linear-gallery.svg",
    menuBarRoute: MenuBarRoutes.album,
  ),
  MenuModel(
    title: Strings.achievements,
    imagePath: "assets/svgIcons/vuesax-linear-award.svg",
    menuBarRoute: MenuBarRoutes.achievements,
  ),
  MenuModel(
    title: Strings.reports,
    imagePath: "assets/svgIcons/vuesax-linear-document-text.svg",
    menuBarRoute: MenuBarRoutes.reports,
  ),
  MenuModel(
    title: Strings.settings,
    imagePath: "assets/svgIcons/vuesax-linear-setting-2.svg",
    menuBarRoute: MenuBarRoutes.settings,
  ),
];

class MenuWidget extends StatelessWidget {
  final MenuModel menuModel;
  final Function() onTap;
  const MenuWidget({super.key, required this.menuModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20.r),
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: menuModel.isSelected
              ? ThemeClass.primaryColor
              : Colors.transparent,
        ),
        child: Row(
          children: [
            SvgPicture.asset(menuModel.imagePath,
                width: 20.r,
                height: 20.r,
                color: !menuModel.isSelected
                    ? ThemeClass.accentColor
                    : Colors.white),
            15.w.widthBox,
            Text(
              menuModel.title.tr,
              style: ThemeStyleHelper.s14SemiBoldTextStyle.copyWith(
                  color: menuModel.isSelected
                      ? Colors.white
                      : ThemeClass.accentColor),
            ).expand,
            //text
          ],
        ),
      ),
    ).addPaddingSymmetric(vertical: 5.h, horizontal: 24.w);
  }
}
