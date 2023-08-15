import 'package:custom_widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:my_dashboard/Modules/Auth/Login/login_controller.dart';

import 'ScreensLayout/l_login_screen.dart';
import 'ScreensLayout/m_login_screen.dart';
import 'ScreensLayout/s_login_screen.dart';

class LoginScreen extends ResponsiveStatefulLayout {
  static const routeName = "/";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  ResponsiveStatefulLayoutState createState() => _LoginScreenState();
}

class _LoginScreenState extends ResponsiveStatefulLayoutState {
  _LoginScreenState() : super(LoginController()) {
    con = LoginController();
  }

  late LoginController con;

  @override
  void initState() {
    con.init();
    super.initState();
  }

  @override
  Widget buildLargeScreen(BuildContext context) {
    return const LargeLoginScreen();
  }

  @override
  Widget buildMediumScreen(BuildContext context) {
    return const MediumLoginScreen();
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return const SmallLoginScreen();
  }
}
