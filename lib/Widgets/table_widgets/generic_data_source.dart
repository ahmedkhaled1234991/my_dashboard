import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../Utilities/theme_helper.dart';

class Pagination {
  final int currentPageNumber;
  final int totalPagesNumber;
  final void Function() goToNextPage;
  final void Function() goToPreviousPage;

  Pagination(
      {required this.currentPageNumber,
      required this.totalPagesNumber,
      required this.goToNextPage,
      required this.goToPreviousPage});
}

class GenericTableController<T> extends AsyncDataTableSource {
  // final Pagination? paginationControl;
  final List<T> itemsList;
  final bool hasRowHeightOverrides;
  final bool hasZebraStripes;
  final Comparable Function(T)? sortFunction;
  final Function(int, bool)? onChangeSelected;
  Function(int)? onDoubleTap;
  List<DataCell> Function(int)? getCells;
  bool Function(int)? isSelected;

  GenericTableController({
    this.itemsList = const [],
    // this.paginationControl,
    this.getCells,
    this.hasRowHeightOverrides = false,
    this.hasZebraStripes = false,
    this.sortFunction,
    this.onDoubleTap,
    this.isSelected,
    this.onChangeSelected,
  }) {
    if (sortFunction != null) sort(sortFunction!, true);
    isSelected ??= (_) => false;
    getCells ??= (_) => [];
    onDoubleTap ??= (_) {};
  }

  void sort(Comparable Function(T) getField, bool ascending) {
    itemsList.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    refreshDatasource();
  }

  @override
  int get rowCount => itemsList.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  int _selectedCount = 0;

  @override
  Future<AsyncRowsResponse> getRows(int start, int end) async {
    return AsyncRowsResponse(
        itemsList.length,
        itemsList.map((item) {
          int index = itemsList.indexOf(item);
          return DataRow2.byIndex(
            index: index,
            selected: isSelected!(index),
            color: isSelected!(index)
                ? MaterialStateProperty.all(
                    ThemeClass.accentColor.withOpacity(0.3))
                : MaterialStateProperty.all(Colors.white),
            onSelectChanged: (_) {
              _selectedCount += !isSelected!(index) ? 1 : -1;
              if (onChangeSelected != null)
                onChangeSelected!(index, !isSelected!(index));
              refreshDatasource();
            },
            onDoubleTap: () => onDoubleTap!(index),
            specificRowHeight: hasRowHeightOverrides ? 100 : null,
            cells: getCells!(index),
          );
        }).toList());
  }
}
