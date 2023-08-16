import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../../Utilities/strings.dart';
import '../../../Widgets/main_screen_widget.dart';
import '../products_controller.dart';

class SmallProductsScreen extends StatefulWidget {
  const SmallProductsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SmallProductsScreenState();
}

class _SmallProductsScreenState extends StateMVC<SmallProductsScreen> {
  _SmallProductsScreenState() : super(ProductsController()) {
    con = ProductsController();
  }

  late ProductsController con;
  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.products.tr,
      content: const Center(
        child: Text('Products small screen'),
      ),
    );
  }
}
