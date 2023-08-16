import 'package:mvc_pattern/mvc_pattern.dart';

class SettingsController extends ControllerMVC {
  // singleton
  factory SettingsController() {
    _this ??= SettingsController._();
    return _this!;
  }
  static SettingsController? _this;
  SettingsController._();
}
