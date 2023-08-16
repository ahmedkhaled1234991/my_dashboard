import 'package:custom_widgets/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

import '../../../Models/menu_model.dart';
import 'ScreensLayout/l_album_screen.dart';
import 'ScreensLayout/m_album_screen.dart';
import 'ScreensLayout/s_album_screen.dart';
import 'album_controller.dart';

class AlbumScreen extends ResponsiveStatefulLayout {
  static String routeName = MenuBarRoutes.album.name;

  const AlbumScreen({Key? key}) : super(key: key);

  @override
  ResponsiveStatefulLayoutState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends ResponsiveStatefulLayoutState {
  _AlbumScreenState() : super(AlbumController()) {
    con = AlbumController();
  }

  late AlbumController con;

  @override
  Widget buildLargeScreen(BuildContext context) {
    return const LargeAlbumScreen();
  }

  @override
  Widget buildMediumScreen(BuildContext context) {
    return const MediumAlbumScreen();
  }

  @override
  Widget buildSmallScreen(BuildContext context) {
    return const SmallAlbumScreen();
  }
}
