import 'package:mvc_pattern/mvc_pattern.dart';

class AlbumController extends ControllerMVC {
  // singleton
  factory AlbumController() {
    _this ??= AlbumController._();
    return _this!;
  }
  static AlbumController? _this;
  AlbumController._();
}
