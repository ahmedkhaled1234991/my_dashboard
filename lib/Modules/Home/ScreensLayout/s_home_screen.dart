import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../../../Utilities/strings.dart';
import '../../../../Widgets/main_screen_widget.dart';
import '../home_controller.dart';

class SmallHomeScreen extends StatefulWidget {
  const SmallHomeScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SmallHomeScreenState();
}

class _SmallHomeScreenState extends StateMVC<SmallHomeScreen> {
  _SmallHomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;

  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.home.tr,
      content: const Center(
        child: Text('Home small screen'),
      ),
    );
  }
}
