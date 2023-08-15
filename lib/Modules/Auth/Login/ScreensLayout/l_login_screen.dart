import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';
import 'package:provider/provider.dart';

import '../../../../Core/Language/app_languages.dart';
import '../../../../Utilities/strings.dart';
import '../../../../Utilities/theme_helper.dart';
import '../../../../Utilities/theme_style_helper.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/custom_textfield_widget.dart';
import '../../../../generated/assets.dart';
import '../login_controller.dart';

class LargeLoginScreen extends StatefulWidget {
  const LargeLoginScreen({super.key});

  @override
  State createState() => _LargeLoginScreenState();
}

class _LargeLoginScreenState extends StateMVC<LargeLoginScreen> {
  _LargeLoginScreenState() : super(LoginController()) {
    con = LoginController();
  }

  late LoginController con;
//"assets/images/logo.png"
  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context, listen: false);
    return Scaffold(
      backgroundColor: ThemeClass.backGroundColor,
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Right Side
            SizedBox(
              height: 920.h,
              width: 983.w,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r)),
                elevation: 3.0,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Image.asset(
                      //   Assets.imagesStatisticsImage,
                      //   height: 700.h,
                      //   width: 700.w,
                      // ),
                      SvgPicture.asset(
                        Assets.imagesLogoImage,
                        height: 700.h,
                        width: 700.w,
                      ),
                      16.h.heightBox,
                      Text(Strings.welcomeToDashboard.tr,
                          style: ThemeStyleHelper.s32RegTextStyle
                              .copyWith(color: ThemeClass.primaryColor)),
                      // Text(Strings.saveYourConnectWithOthers.tr,
                      //         style: ThemeStyleHelper.s16RegTextStyle
                      //             .copyWith(color: ThemeClass.accentColor))
                      //     .widthBox(650.w),
                    ],
                  ).addPaddingAll(16.0),
                ),
              ),
            ),
            80.0.w.widthBox,
            //*   Left Side
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: SizedBox(
                    // height: 20.h,
                    width: 100.w,
                    child: InkWell(
                      onTap: () async {
                        await appLan.changeLanguage();
                        await Future.delayed(const Duration(milliseconds: 50));
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.imagesSvgIconsGlobal,
                            width: 20.r,
                            height: 20.r,
                            color: ThemeClass.primaryColor,
                          ),
                          8.w.widthBox,
                          Text(Strings.languageValue.tr,
                              style: ThemeStyleHelper.s14SemiBoldTextStyle
                                  .copyWith(color: ThemeClass.primaryColor))
                        ],
                      ),
                    ),
                  ),
                ),
                24.h.heightBox,
                CircleAvatar(
                  radius: 100.w,
                  backgroundColor: ThemeClass.primaryColor,
                  child: SvgPicture.asset(Assets.imagesSvgIconsPerson,
                      height: 128.r, width: 128.r),
                ),
                40.h.heightBox,
                Text(Strings.loginToYourAccount.tr,
                    style: ThemeStyleHelper.s32RegTextStyle
                        .copyWith(color: ThemeClass.darkGreyColor)),
                43.h.heightBox,
                //*   username field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.username.tr,
                        style: ThemeStyleHelper.s14SemiBoldTextStyle
                            .copyWith(color: ThemeClass.darkGreyColor)),
                    16.h.heightBox,
                    CustomTextFieldWidget(
                      controller: con.usernameController,
                      hint: Strings.username.tr,
                      backGroundColor: Colors.white,
                      width: 480.w,
                      prefixIcon: SvgPicture.asset(
                        Assets.imagesSvgIconsProfile,
                        height: 24.w,
                        width: 24.w,
                        color: ThemeClass.primaryColor,
                      ).addPaddingHorizontal(16.w),
                    ),
                  ],
                ),
                24.h.heightBox,
                //*   Password field
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.password.tr,
                        style: ThemeStyleHelper.s14SemiBoldTextStyle
                            .copyWith(color: ThemeClass.darkGreyColor)),
                    16.h.heightBox,
                    CustomTextFieldWidget(
                      backGroundColor: Colors.white,
                      controller: con.passwordController,
                      hint: Strings.password.tr,
                      width: 480.w,
                      obscure: con.isSecure,
                      prefixIcon: SvgPicture.asset(
                        Assets.imagesSvgIconsLock,
                        height: 24.w,
                        width: 24.w,
                        color: ThemeClass.primaryColor,
                      ).addPaddingHorizontal(16.w),
                      suffixIcon: SvgPicture.asset(
                          con.isSecure
                              ? Assets.imagesSvgIconsEye
                              : Assets.imagesSvgIconsEyeSlash,
                          height: 24.w,
                          width: 24.w,
                          color: ThemeClass.primaryColor),
                      onSuffixTap: con.changePasswordVisibility,
                    ),
                  ],
                ),
                58.h.heightBox,
                //*   Login Button
                CustomButtonWidget(
                  width: 480.w,
                  borderRadius: BorderRadius.circular(8.r),
                  backGroundColor: ThemeClass.primaryColor,
                  title: Strings.login.tr,
                  textStyle: ThemeStyleHelper.s16RegTextStyle
                      .copyWith(color: Colors.white),
                  onTap: () => con.login(context),
                ),
              ],
            ).addPaddingAll(16.0).expand,
          ],
        ),
      ).addPaddingAll(80.r),
    );
  }
}
