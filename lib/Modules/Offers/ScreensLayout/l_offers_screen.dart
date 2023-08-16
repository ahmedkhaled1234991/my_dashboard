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
import '../offers_controller.dart';

class LargeOffersScreen extends StatefulWidget {
  const LargeOffersScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LargeOffersScreenState();
}

class _LargeOffersScreenState extends StateMVC<LargeOffersScreen> {
  _LargeOffersScreenState() : super(OffersController()) {
    con = OffersController();
  }

  late OffersController con;

  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.offers.tr,
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
