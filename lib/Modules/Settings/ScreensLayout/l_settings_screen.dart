import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../../../Utilities/strings.dart';
import '../../../../Widgets/main_screen_widget.dart';
import '../settings_controller.dart';

class LargeSettingsScreen extends StatefulWidget {
  const LargeSettingsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LargeSettingsScreenState();
}

class _LargeSettingsScreenState extends StateMVC<LargeSettingsScreen> {
  _LargeSettingsScreenState() : super(SettingsController()) {
    con = SettingsController();
  }

  late SettingsController con;

  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.settings.tr,
      content: Container(),
    );
  }
}
