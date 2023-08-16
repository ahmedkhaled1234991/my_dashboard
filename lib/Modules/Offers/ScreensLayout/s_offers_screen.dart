import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../../Utilities/strings.dart';
import '../../../Widgets/main_screen_widget.dart';
import '../offers_controller.dart';

class SmallOffersScreen extends StatefulWidget {
  const SmallOffersScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SmallOffersScreenState();
}

class _SmallOffersScreenState extends StateMVC<SmallOffersScreen> {
  _SmallOffersScreenState() : super(OffersController()) {
    con = OffersController();
  }

  late OffersController con;
  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.offers.tr,
      content: const Center(
        child: Text('Offers small screen'),
      ),
    );
  }
}
