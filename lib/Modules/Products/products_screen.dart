import 'package:custom_widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:my_dashboard/Modules/Products/ScreensLayout/l_products_screen.dart';
import 'package:my_dashboard/Modules/Products/ScreensLayout/m_products_screen.dart';
import 'package:my_dashboard/Modules/Products/ScreensLayout/s_products_screen.dart';
import 'package:my_dashboard/Modules/Products/products_controller.dart';

import '../../../Models/menu_model.dart';

class ProductsScreen extends ResponsiveStatefulLayout {
  static String routeName = MenuBarRoutes.products.name;

  const ProductsScreen({Key? key}) : super(key: key);

  @override
  ResponsiveStatefulLayoutState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ResponsiveStatefulLayoutState {
  _ProductsScreenState() : super(ProductsController()) {
    con = ProductsController();
  }

  late ProductsController con;

  @override
  void initState() {
    con.getProductsList();
    super.initState();
  }

  @override
  Widget buildLargeScreen(BuildContext context) {
    return const LargeProductsScreen();
  }

  @override
  Widget buildMediumScreen(BuildContext context) {
    return const MediumProductsScreen();
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return const SmallProductsScreen();
  }
}
