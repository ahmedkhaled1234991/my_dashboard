import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../Utilities/theme_helper.dart';
import '../../../../Utilities/theme_style_helper.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/custom_textfield_widget.dart';
import '../login_controller.dart';

class SmallLoginScreen extends StatefulWidget {
  const SmallLoginScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SmallLoginScreenState();
}

class _SmallLoginScreenState extends StateMVC<SmallLoginScreen> {
  _SmallLoginScreenState() : super(LoginController()) {
    con = LoginController();
  }

  late LoginController con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            CustomTextFieldWidget(
              controller: con.usernameController,
              hint: "username",
              width: 200.w,
              height: 40.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextFieldWidget(
              controller: con.passwordController,
              hint: "password",
              width: 200.w,
              height: 40.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "forgot password?",
                style:
                    TextStyle(color: ThemeClass.primaryColor, fontSize: 16.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButtonWidget(
              onTap: () => con.login(context),
              backGroundColor: ThemeClass.primaryColor,
              textStyle: ThemeStyleHelper.s16RegTextStyle,
              title: "login",
              width: 100.w,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {},
              child: Text(
                "register a new account",
                style:
                    TextStyle(color: ThemeClass.primaryColor, fontSize: 16.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
