import 'package:custom_widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:my_dashboard/Modules/Settings/settings_controller.dart';

import '../../../Models/menu_model.dart';
import 'ScreensLayout/l_settings_screen.dart';
import 'ScreensLayout/m_settings_screen.dart';
import 'ScreensLayout/s_settings_screen.dart';

class SettingsScreen extends ResponsiveStatefulLayout {
  static String routeName = MenuBarRoutes.settings.name;

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ResponsiveStatefulLayoutState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ResponsiveStatefulLayoutState {
  _SettingsScreenState() : super(SettingsController()) {
    con = SettingsController();
  }

  late SettingsController con;

  @override
  Widget buildLargeScreen(BuildContext context) {
    return const LargeSettingsScreen();
  }

  @override
  Widget buildMediumScreen(BuildContext context) {
    return const MediumSettingsScreen();
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return const SmallSettingsScreen();
  }
}
