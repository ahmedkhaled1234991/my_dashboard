import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../../Utilities/strings.dart';
import '../../../Widgets/main_screen_widget.dart';
import '../achievements_controller.dart';

class SmallAchievementsScreen extends StatefulWidget {
  const SmallAchievementsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SmallAchievementsScreenState();
}

class _SmallAchievementsScreenState extends StateMVC<SmallAchievementsScreen> {
  _SmallAchievementsScreenState() : super(AchievementsController()) {
    con = AchievementsController();
  }

  late AchievementsController con;
  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.achievements.tr,
      content: const Center(
        child: Text('Achievements small screen'),
      ),
    );
  }
}
