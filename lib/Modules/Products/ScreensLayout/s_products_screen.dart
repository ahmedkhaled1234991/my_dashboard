import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../../../Utilities/theme_helper.dart';
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
    return const Scaffold(
      backgroundColor: ThemeClass.backGroundColor,
      body: Center(
        child: Text('Products small screen'),
      ),
    );
  }
}
