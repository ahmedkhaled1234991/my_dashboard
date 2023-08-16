import 'package:custom_widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../../../Models/menu_model.dart';
import 'ScreensLayout/l_achievements_screen.dart';
import 'ScreensLayout/m_achievements_screen.dart';
import 'ScreensLayout/s_achievements_screen.dart';
import 'achievements_controller.dart';

class AchievementsScreen extends ResponsiveStatefulLayout {
  static String routeName = MenuBarRoutes.achievements.name;

  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  ResponsiveStatefulLayoutState createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends ResponsiveStatefulLayoutState {
  _AchievementsScreenState() : super(AchievementsController()) {
    con = AchievementsController();
  }

  late AchievementsController con;

  @override
  Widget buildLargeScreen(BuildContext context) {
    return const LargeAchievementsScreen();
  }

  @override
  Widget buildMediumScreen(BuildContext context) {
    return const MediumAchievementsScreen();
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return const SmallAchievementsScreen();
  }
}
