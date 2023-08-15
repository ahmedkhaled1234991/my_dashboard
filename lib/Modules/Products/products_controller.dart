import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Modules/Products/products_data_handler.dart';

import '../../Models/products_model.dart';

class ProductsController extends ControllerMVC {
  // singleton
  factory ProductsController() {
    _this ??= ProductsController._();
    return _this!;
  }
  static ProductsController? _this;
  ProductsController._();

  bool loading = false;
  List<ProductsModel> productsList = ProductsModel.mockList;

  Future getProductsList() async {
    setState(() {
      loading = true;
    });
    final result = await ProductsDataHandler.getProductsList();
    result.fold((l) {}, (r) {
      productsList = r;
    });
    setState(() {
      loading = false;
    });
  }
}
