import 'package:custom_widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:my_dashboard/Modules/Offers/ScreensLayout/l_offers_screen.dart';
import 'package:my_dashboard/Modules/Offers/ScreensLayout/m_offers_screen.dart';
import 'package:my_dashboard/Modules/Offers/ScreensLayout/s_offers_screen.dart';

import '../../../Models/menu_model.dart';
import 'offers_controller.dart';

class OffersScreen extends ResponsiveStatefulLayout {
  static String routeName = MenuBarRoutes.offers.name;

  const OffersScreen({Key? key}) : super(key: key);

  @override
  ResponsiveStatefulLayoutState createState() => _OffersScreenState();
}

class _OffersScreenState extends ResponsiveStatefulLayoutState {
  _OffersScreenState() : super(OffersController()) {
    con = OffersController();
  }

  late OffersController con;

  @override
  Widget buildLargeScreen(BuildContext context) {
    return const LargeOffersScreen();
  }

  @override
  Widget buildMediumScreen(BuildContext context) {
    return const MediumOffersScreen();
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return const SmallOffersScreen();
  }
}
