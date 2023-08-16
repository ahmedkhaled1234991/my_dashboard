import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../../Utilities/strings.dart';
import '../../../Widgets/main_screen_widget.dart';
import '../reports_controller.dart';

class SmallReportsScreen extends StatefulWidget {
  const SmallReportsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SmallReportsScreenState();
}

class _SmallReportsScreenState extends StateMVC<SmallReportsScreen> {
  _SmallReportsScreenState() : super(ReportsController()) {
    con = ReportsController();
  }

  late ReportsController con;
  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.reports.tr,
      content: const Center(
        child: Text('Reports small screen'),
      ),
    );
  }
}
