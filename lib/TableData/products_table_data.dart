import 'package:custom_widgets/custom_widgets.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../Models/products_model.dart';
import '../Models/table_data_model.dart';
import '../Utilities/strings.dart';
import '../Utilities/theme_helper.dart';
import '../Utilities/theme_style_helper.dart';
import '../Widgets/table_widgets/generic_data_source.dart';

class ProductsDataTable<T extends ProductsModel> with WidgetColorMixin {
  final BuildContext context;
  // final Function(ProductsModel, BuildContext) onDelete;
  ProductsDataTable({required this.context}); //required this.onDelete

  GenericTableController<T> getGenericTableController(
      {required List<T> listData, required BuildContext context}) {
    return GenericTableController<T>(
      getCells: (index) => _cells(listData[index], context),
      itemsList: listData,
      isSelected: (index) => listData[index].selected,
      onChangeSelected: (index, v) => listData[index].selected = v,
      onDoubleTap: (index) {},
    );
  }

  List<TableDataModel> getCellsDataTable(
          {Function<G>(Comparable<G> Function(ProductsModel d), int, bool)?
              sort,
          ProductsModel? item}) =>
      [
        TableDataModel(
          id: 1,
          columnTitle: Strings.name.tr,
          cellValue: "لبن مجفف",
          columnSize: ColumnSize.M,
        ),
        TableDataModel(
          id: 2,
          columnTitle: Strings.section.tr,
          cellValue: "عروض الجمعية",
          columnSize: ColumnSize.L,
        ),
        TableDataModel(
          id: 3,
          columnTitle: Strings.country.tr,
          cellValue: "الكويت",
          columnSize: ColumnSize.L,
        ),
        TableDataModel(
          id: 4,
          columnTitle: Strings.supplierName.tr,
          cellValue: "احمد خالد",
          columnSize: ColumnSize.L,
        ),
        TableDataModel(
          id: 5,
          columnTitle: Strings.description.tr,
          cellValue: "كرتونة",
          columnSize: ColumnSize.L,
        ),
        TableDataModel(
          id: 6,
          columnTitle: Strings.notes.tr,
          cellValue: "--",
          columnSize: ColumnSize.L,
        ),
        TableDataModel.customWidget(
          id: 7,
          columnTitle: Strings.editing.tr,
          cellWidget: InkWell(
              onTap:
                  () {}, //context.goNamed(AddUpdateProductScreen.routeName,queryParameters: {"productId": "987654321"}),
              child: SvgPicture.asset(
                  "assets/svgIcons/vuesax-outline-message-edit.svg",
                  width: 20.r,
                  height: 20.r)),
          columnSize: ColumnSize.S,
        ),
        TableDataModel.customWidget(
          id: 8,
          columnTitle: Strings.delete.tr,
          cellWidget: InkWell(
            onTap: () {
              // DialogsHelper.dialog(context: context, message: Strings.deleteProduct.tr,
              //     title: Strings.deleteProduct.tr).deleteDialog(
              //   warningMessage: Strings.productWarningMessage.tr,
              //   confirmDelete: ()=> onDelete(item!, context),
              // );
            },
            child: SvgPicture.asset("assets/svgIcons/vuesax-outline-trash.svg",
                width: 20.r, height: 20.r),
          ),
          columnSize: ColumnSize.S,
        ),
      ];

  static List<ManipulateTable> tableCellsManipulate = [
    ManipulateTable(columnId: 1, index: 0),
    ManipulateTable(columnId: 2, index: 1),
    ManipulateTable(columnId: 3, index: 2),
    ManipulateTable(columnId: 4, index: 3),
    ManipulateTable(columnId: 5, index: 4),
    ManipulateTable(columnId: 6, index: 5),
    ManipulateTable(columnId: 7, index: 6),
    ManipulateTable(columnId: 8, index: 7),
  ];

  List<DataColumn> columnsData(
      Function<G>(
        Comparable<G> Function(T d) getField,
        int columnIndex,
        bool ascending,
      ) sort) {
    List<TableDataModel> columns = getCellsDataTable(sort: sort);
    tableCellsManipulate.sort((a, b) => a.index.compareTo(b.index));
    return [...tableCellsManipulate].where((element) => element.show).map((eM) {
      final e = columns.firstWhere((element) => element.id == eM.columnId);
      return DataColumn2(
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              e.columnTitle,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: ThemeStyleHelper.s16SemiBoldTextStyle
                  .copyWith(color: ThemeClass.accentColor),
              maxLines: 2,
              textAlign: TextAlign.center,
            ).expand,
          ],
        ),
        onSort: e.sort,
        numeric: e.numeric,
        fixedWidth: e.fixedWidth,
        size: e.columnSize,
      );
    }).toList();
  }

  List<DataCell> _cells(ProductsModel item, context) {
    List<TableDataModel> cells = getCellsDataTable(item: item);
    tableCellsManipulate.sort((a, b) => a.index.compareTo(b.index));
    return [...tableCellsManipulate].where((element) => element.show).map((eM) {
      final e = cells.firstWhere((element) => element.id == eM.columnId);
      return DataCell(
        Align(
          alignment:
              e.center ? Alignment.center : AlignmentDirectional.centerStart,
          child: e.cellWidget ??
              Text(
                e.cellValue ?? "-",
                style: ThemeStyleHelper.s16SemiBoldTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
        ),
      );
    }).toList();
  }
}
