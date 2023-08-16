import 'package:custom_widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../../Models/menu_model.dart';
import 'ScreensLayout/l_home_screen.dart';
import 'ScreensLayout/m_home_screen.dart';
import 'ScreensLayout/s_home_screen.dart';
import 'home_controller.dart';

class HomeScreen extends ResponsiveStatefulLayout {
  static String routeName = MenuBarRoutes.home.name;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  ResponsiveStatefulLayoutState createState() => _HomeScreenState();
}

class _HomeScreenState extends ResponsiveStatefulLayoutState {
  _HomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildLargeScreen(BuildContext context) {
    return const LargeHomeScreen();
  }

  @override
  Widget buildMediumScreen(BuildContext context) {
    return const MediumHomeScreen();
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return const SmallHomeScreen();
  }
}
