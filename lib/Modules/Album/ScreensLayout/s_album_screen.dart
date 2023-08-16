import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:my_dashboard/Core/Language/locales.dart';

import '../../../Utilities/strings.dart';
import '../../../Widgets/main_screen_widget.dart';
import '../album_controller.dart';

class SmallAlbumScreen extends StatefulWidget {
  const SmallAlbumScreen({Key? key}) : super(key: key);

  @override
  State createState() => _SmallAlbumScreenState();
}

class _SmallAlbumScreenState extends StateMVC<SmallAlbumScreen> {
  _SmallAlbumScreenState() : super(AlbumController()) {
    con = AlbumController();
  }

  late AlbumController con;
  @override
  Widget build(BuildContext context) {
    return MainScreenWidget(
      title: Strings.album.tr,
      content: const Center(
        child: Text('Album small screen'),
      ),
    );
  }
}
