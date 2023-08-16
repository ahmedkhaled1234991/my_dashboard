import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Models/sales_data_model.dart';
import '../../Utilities/strings.dart';

class HomeController extends ControllerMVC {
  // singleton
  factory HomeController() {
    _this ??= HomeController._();
    return _this!;
  }
  static HomeController? _this;
  HomeController._();

  bool loading = false;
  late TextEditingController searchController;
  List<SalesDataModel> data = [
    SalesDataModel(Strings.january, 35),
    SalesDataModel(Strings.february, 28),
    SalesDataModel(Strings.march, 34),
    SalesDataModel(Strings.april, 32),
    SalesDataModel(Strings.may, 40)
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future getSections() async {
    setState(() {
      loading = true;
    });
    // final result = await SectionDataHandler.getSections();
    // result.fold((l){}, (r){
    //   sectionsList = r;
    // });
    // setState(() {loading = false;});
  }

  // Future onDeleteSection(SectionModel section, BuildContext context) async{
  //   setState(() {loading = true;});
  //   final result = await SectionDataHandler.deleteSection(id: 0);
  //   result.fold(
  //           (l) {},
  //           (r) {
  //             DialogsHelper.dialog(context: context, message: Strings.deletedSectionSuccessfully.tr).successDialog();
  //           },
  //   );
  //   sectionsList.remove(section);
  //   setState(() {loading = false;});
  // }
}
