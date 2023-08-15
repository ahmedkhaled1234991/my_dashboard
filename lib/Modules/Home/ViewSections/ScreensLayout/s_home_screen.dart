import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../Utilities/theme_helper.dart';
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
    return const Scaffold(
      backgroundColor: ThemeClass.backGroundColor,
      body: Center(
        child: Text('Home small screen'),
      ),
    );
  }
}
