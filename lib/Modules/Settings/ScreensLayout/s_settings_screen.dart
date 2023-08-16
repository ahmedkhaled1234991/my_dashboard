import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../../Utilities/strings.dart';
import '../../../Widgets/main_screen_widget.dart';
import '../settings_controller.dart';

class SmallSettingsScreen extends StatefulWidget {
  const SmallSettingsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SmallSettingsScreenState();
}

class _SmallSettingsScreenState extends StateMVC<SmallSettingsScreen> {
  _SmallSettingsScreenState() : super(SettingsController()) {
    con = SettingsController();
  }

  late SettingsController con;
  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.settings.tr,
      content: const Center(
        child: Text('Settings small screen'),
      ),
    );
  }
}
