class ProductsModel {
  bool selected;

  ProductsModel({this.selected = false});

  factory ProductsModel.fromMap(Map<String, dynamic> json) {
    return ProductsModel();
  }

  static List<ProductsModel> mockList = [
    ProductsModel(),
    ProductsModel(),
    ProductsModel(),
    ProductsModel(),
    ProductsModel(),
    ProductsModel(),
    ProductsModel(),
    ProductsModel(),
  ];

  Map<String, String> toJson() {
    return {};
  }
}
