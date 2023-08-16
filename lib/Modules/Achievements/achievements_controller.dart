import 'package:mvc_pattern/mvc_pattern.dart';

class AchievementsController extends ControllerMVC {
  // singleton
  factory AchievementsController() {
    _this ??= AchievementsController._();
    return _this!;
  }
  static AchievementsController? _this;
  AchievementsController._();
}
