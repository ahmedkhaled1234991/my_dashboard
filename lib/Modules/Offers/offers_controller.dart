import 'package:mvc_pattern/mvc_pattern.dart';

class OffersController extends ControllerMVC {
  // singleton
  factory OffersController() {
    _this ??= OffersController._();
    return _this!;
  }
  static OffersController? _this;
  OffersController._();
}
