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
import '../achievements_controller.dart';

class LargeAchievementsScreen extends StatefulWidget {
  const LargeAchievementsScreen({Key? key}) : super(key: key);

  @override
  State createState() => _LargeAchievementsScreenState();
}

class _LargeAchievementsScreenState extends StateMVC<LargeAchievementsScreen> {
  _LargeAchievementsScreenState() : super(AchievementsController()) {
    con = AchievementsController();
  }

  late AchievementsController con;

  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.achievements.tr,
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
