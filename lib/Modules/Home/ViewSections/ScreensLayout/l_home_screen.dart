import 'package:custom_widgets/layout/loading_widget.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';
import 'package:my_dashboard/Utilities/theme_helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../Models/sales_data_model.dart';
import '../../../../Utilities/strings.dart';
import '../../../../Utilities/theme_style_helper.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/main_screen_widget.dart';
import '../../../../generated/assets.dart';
import '../home_controller.dart';

class LargeHomeScreen extends StatefulWidget {
  const LargeHomeScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LargeHomeScreenState();
}

class _LargeHomeScreenState extends StateMVC<LargeHomeScreen> {
  _LargeHomeScreenState() : super(HomeController()) {
    con = HomeController();
  }

  late HomeController con;
  List<SalesDataModel> data = [
    SalesDataModel('Jan', 35),
    SalesDataModel('Feb', 28),
    SalesDataModel('Mar', 34),
    SalesDataModel('Apr', 32),
    SalesDataModel('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return LoadingWidget(
      loading: false,
      child: MainScreenWidget(
        title: Strings.home.tr,
        searchController: con.searchController,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 296.w,
                  height: 128.h,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.iconStaff,
                            width: 72.r, height: 72.r),
                        16.w.widthBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            4.0.h.heightBox,
                            Text(
                              '1000',
                              style: ThemeStyleHelper.s22RegTextStyle.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2),
                            ),
                            Text(
                              'عدد الموظفين',
                              style: ThemeStyleHelper.s16RegTextStyle
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ).addPaddingHorizontal(24.w),
                  ),
                ),
                24.0.w.widthBox,
                SizedBox(
                  width: 296.w,
                  height: 128.h,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.iconProduct,
                            width: 72.r, height: 72.r),
                        16.w.widthBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            4.0.h.heightBox,
                            Text(
                              '5000',
                              style: ThemeStyleHelper.s22RegTextStyle.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2),
                            ),
                            Text(
                              'اجمالى المنتجات',
                              style: ThemeStyleHelper.s16RegTextStyle
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ).addPaddingHorizontal(24.w),
                  ),
                ),
                24.0.w.widthBox,
                SizedBox(
                  width: 296.w,
                  height: 128.h,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.iconProfit,
                            width: 72.r, height: 72.r),
                        16.w.widthBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            4.0.h.heightBox,
                            Text(
                              '300000',
                              style: ThemeStyleHelper.s22RegTextStyle.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2),
                            ),
                            Text(
                              'اجمالى الارباح',
                              style: ThemeStyleHelper.s16RegTextStyle
                                  .copyWith(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ).addPaddingHorizontal(24.w),
                  ),
                ),
              ],
            ),
            24.0.h.heightBox,
            Row(
              children: [
                SizedBox(
                  width: context.sizes.width / 1.9,
                  height: 400.h,
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<SalesDataModel, String>>[
                          SplineAreaSeries<SalesDataModel, String>(
                            dataSource: data,
                            xValueMapper: (SalesDataModel sales, _) =>
                                sales.year,
                            yValueMapper: (SalesDataModel sales, _) =>
                                sales.sales,
                            enableTooltip: true,
                            color: ThemeClass.primaryColor,
                            // Enable data label
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: false),
                          )
                        ]).addPaddingAll(16.r),
                  ),
                ),
                16.0.w.widthBox,
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<SalesDataModel, String>>[
                        ColumnSeries<SalesDataModel, String>(
                          dataSource: data,
                          xValueMapper: (SalesDataModel sales, _) => sales.year,
                          yValueMapper: (SalesDataModel sales, _) =>
                              sales.sales,
                          enableTooltip: true,
                          color: ThemeClass.primaryColor,
                          width: 0.3,
                          borderRadius: BorderRadius.circular(4.r),
                          // Enable data label
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false),
                        )
                      ]).addPaddingAll(8.r),
                ).heightBox(400.h).expand,
              ],
            ),
          ],
        ),
        // content: GenericTableWidget<SectionModel>(
        //   genericTableController:
        //       tableData.getGenericTableController(listData: con.sectionsList),
        //   getColumns: tableData.columnsData,
        // ),
        leadingWidget: CustomButtonWidget.customWidget(
          onTap: () {},
          titleWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.imagesSvgIconsAdd,
                width: 20.r,
                height: 20.r,
                color: Colors.white,
              ),
              14.w.widthBox,
              Text(
                Strings.add.tr,
                style: ThemeStyleHelper.s16RegTextStyle
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
