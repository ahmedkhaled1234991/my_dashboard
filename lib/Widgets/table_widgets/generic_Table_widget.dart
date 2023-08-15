import 'package:custom_widgets/custom_widgets.dart';
import 'package:custom_widgets/widget_mixin/base_stateful_widget.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_dashboard/Widgets/table_widgets/generic_data_source.dart';
import 'package:my_dashboard/Widgets/table_widgets/table_nav_helper.dart';

import '../../Utilities/theme_helper.dart';

class GenericTableWidget<T> extends BaseStateful {
  final GenericTableController<T> genericTableController;
  final double? minWidth;
  final List<DataColumn> Function(
      Function<G>(
        Comparable<G> Function(T d) getField,
        int columnIndex,
        bool ascending,
      )) getColumns;
  const GenericTableWidget({
    required this.genericTableController,
    required this.getColumns,
    this.minWidth,
    Key? key,
  }) : super(key: key);

  @override
  State<GenericTableWidget> createState() => _GenericTableWidgetState<T>();
}

class _GenericTableWidgetState<T> extends BaseStatefulState<GenericTableWidget>
    with WidgetColorMixin {
  int _rowsPerPage = 50;
  bool _sortAscending = true;
  int? _sortColumnIndex;
  bool _initialized = false;

  late GenericTableController<T> genericTableController;

  @override
  void initState() {
    genericTableController =
        widget.genericTableController as GenericTableController<T>;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      if (getCurrentRouteOption(context) == defaultSorting) {
        _sortColumnIndex = 1;
      }
      _initialized = true;
    }
  }

  void sort<G>(
    Comparable<G> Function(T d) getField,
    int columnIndex,
    bool ascending,
  ) {
    genericTableController.sort(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  @override
  void dispose() {
    genericTableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    genericTableController.refreshDatasource();
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Theme(
            data: ThemeData(
              iconTheme: IconThemeData(
                color: kAccentColor,
              ),
              cardTheme: const CardTheme(
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            child: AsyncPaginatedDataTable2(
              dataRowHeight: 65.h,
              headingRowHeight: 56.h,
              showCheckboxColumn: false,
              horizontalMargin: 8,
              checkboxHorizontalMargin: 8,
              columnSpacing: 8,
              wrapInCard: true,
              renderEmptyRowsInTheEnd: false,
              headingRowColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
              rowsPerPage: _rowsPerPage,
              autoRowsToHeight: getCurrentRouteOption(context) == autoRows,
              lmRatio: 1.5,
              smRatio: 0.5,
              minWidth: widget.minWidth,
              fit: FlexFit.tight,
              pageSyncApproach: getCurrentRouteOption(context) == dflt
                  ? PageSyncApproach.doNothing
                  : getCurrentRouteOption(context) == autoRows
                      ? PageSyncApproach.goToLast
                      : PageSyncApproach.goToFirst,
              border: TableBorder(
                top: const BorderSide(color: ThemeClass.accentColor, width: 1),
                bottom:
                    const BorderSide(color: ThemeClass.accentColor, width: 1),
                horizontalInside: BorderSide(color: Colors.white, width: 5.r),
              ),
              onRowsPerPageChanged: (value) =>
                  _rowsPerPage = value ?? _rowsPerPage,
              initialFirstRowIndex: 0,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              sortArrowIcon: Icons.keyboard_arrow_up,
              sortArrowAnimationDuration: const Duration(milliseconds: 0),
              onSelectAll: (select) => select != null && select
                  ? (getCurrentRouteOption(context) != selectAllPage
                      ? genericTableController.selectAll()
                      : genericTableController.selectAllOnThePage())
                  : (getCurrentRouteOption(context) != selectAllPage
                      ? genericTableController.deselectAll()
                      : genericTableController.deselectAllOnThePage()),
              hidePaginator: true,
              columns: widget.getColumns(sort),
              empty: Center(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.grey[200],
                    child: const Text('No data')),
              ),
              source: genericTableController,
              loading: const CircularProgressIndicator().center,
            ).expand,
          ),
          // if (genericTableController.paginationControl != null)
          //   Row(
          //     children: [
          //       TablePager(
          //         pagination: genericTableController.paginationControl!,
          //       ),
          //     ],
          //   ).addPaddingHorizontal(10),
          8.0.heightBox,
        ],
      ),
    );
  }
}
