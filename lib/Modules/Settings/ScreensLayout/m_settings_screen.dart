import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../../../Utilities/strings.dart';
import '../../../../Widgets/main_screen_widget.dart';
import '../settings_controller.dart';

class MediumSettingsScreen extends StatefulWidget {
  const MediumSettingsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _MediumSettingsScreenState();
}

class _MediumSettingsScreenState extends StateMVC<MediumSettingsScreen> {
  _MediumSettingsScreenState() : super(SettingsController()) {
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
