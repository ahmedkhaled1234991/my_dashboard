import 'package:custom_widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:my_dashboard/Modules/Reports/reports_controller.dart';

import '../../../Models/menu_model.dart';
import 'ScreensLayout/l_reports_screen.dart';
import 'ScreensLayout/m_reports_screen.dart';
import 'ScreensLayout/s_reports_screen.dart';

class ReportsScreen extends ResponsiveStatefulLayout {
  static String routeName = MenuBarRoutes.reports.name;

  const ReportsScreen({Key? key}) : super(key: key);

  @override
  ResponsiveStatefulLayoutState createState() => _ReportsScreenState();
}

class _ReportsScreenState extends ResponsiveStatefulLayoutState {
  _ReportsScreenState() : super(ReportsController()) {
    con = ReportsController();
  }

  late ReportsController con;

  @override
  Widget buildLargeScreen(BuildContext context) {
    return const LargeReportsScreen();
  }

  @override
  Widget buildMediumScreen(BuildContext context) {
    return const MediumReportsScreen();
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return const SmallReportsScreen();
  }
}
