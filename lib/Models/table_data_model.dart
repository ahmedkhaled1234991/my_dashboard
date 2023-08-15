
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class TableDataModel{
  final Widget? cellWidget;
  final String columnTitle;
  final String? cellValue;
  final bool center,numeric;
  final DataColumnSortCallback? sort;
  final ColumnSize columnSize;
  final double? fixedWidth;
  final int id;

  TableDataModel({required this.id,this.sort,this.center = true,required this.cellValue,required this.columnTitle,this.columnSize = ColumnSize.M,this.fixedWidth,this.numeric = false}): cellWidget = null;
  TableDataModel.customWidget({required this.id,this.sort,this.center = true,required this.cellWidget,required this.columnTitle,this.columnSize = ColumnSize.M,this.fixedWidth,this.numeric = false}): cellValue = null;
}


class ManipulateTable{
  final int columnId;
  bool show;
  int index;

  ManipulateTable({required this.columnId,this.show = true,required this.index});
}