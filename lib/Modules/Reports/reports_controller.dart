import 'package:mvc_pattern/mvc_pattern.dart';

class ReportsController extends ControllerMVC {
  // singleton
  factory ReportsController() {
    _this ??= ReportsController._();
    return _this!;
  }
  static ReportsController? _this;
  ReportsController._();
}
