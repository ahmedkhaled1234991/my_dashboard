import 'package:custom_widgets/layout/loading_widget.dart';
import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../../../Utilities/strings.dart';
import '../../../../Utilities/theme_style_helper.dart';
import '../../../../Widgets/custom_button_widget.dart';
import '../../../../Widgets/main_screen_widget.dart';
import '../../../../generated/assets.dart';
import '../../../Models/products_model.dart';
import '../../../TableData/products_table_data.dart';
import '../../../Widgets/table_widgets/generic_Table_widget.dart';
import '../products_controller.dart';

class LargeProductsScreen extends StatefulWidget {
  const LargeProductsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LargeProductsScreenState();
}

class _LargeProductsScreenState extends StateMVC<LargeProductsScreen> {
  _LargeProductsScreenState() : super(ProductsController()) {
    con = ProductsController();
  }

  late ProductsController con;

  @override
  Widget build(BuildContext context) {
    final tableData = ProductsDataTable<ProductsModel>(context: context);
    return LoadingWidget(
      loading: con.loading,
      showAsOpacity: con.productsList?.isNotEmpty ?? false,
      child: MainScreenWidget(
        title: Strings.products.tr,
        content: GenericTableWidget<ProductsModel>(
          genericTableController: tableData.getGenericTableController(
              listData: con.productsList ?? ProductsModel.mockList,
              context: context),
          getColumns: tableData.columnsData,
        ),
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
