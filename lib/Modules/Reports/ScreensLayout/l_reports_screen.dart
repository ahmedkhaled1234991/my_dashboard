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
import '../reports_controller.dart';

class LargeReportsScreen extends StatefulWidget {
  const LargeReportsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LargeReportsScreenState();
}

class _LargeReportsScreenState extends StateMVC<LargeReportsScreen> {
  _LargeReportsScreenState() : super(ReportsController()) {
    con = ReportsController();
  }

  late ReportsController con;

  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.reports.tr,
      content: Container(),
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
    );
  }
}
