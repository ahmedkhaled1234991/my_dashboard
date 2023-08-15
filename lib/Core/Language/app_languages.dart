import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../Utilities/shared_preferences.dart';

enum Languages {en,ar}

class AppLanguage extends ChangeNotifier {
  static const Languages defaultLanguage = Languages.ar;

  Languages _appLanguage = defaultLanguage;

  Languages get appLang => _appLanguage;

  Future fetchLocale() async {
    if (SharedPref.getLanguage() == null){
      if(!kDebugMode){
        final List<String> systemLocales = WidgetsBinding.instance.window.locales.map((e) => e.languageCode).toList();
        _appLanguage = Languages.values.firstWhere((lang) => systemLocales.contains(lang.name));
      }else{
        _appLanguage = defaultLanguage;
      }
    }else{
      _appLanguage = Languages.values.firstWhere((lang) => lang.name == SharedPref.getLanguage());
    }
  }

  Future changeLanguage({Languages? language}) async {
    if(language == _appLanguage) return;
    switch(language){
      case Languages.en:
        _appLanguage = Languages.en;
        break;
      case Languages.ar:
        _appLanguage = Languages.ar;
        break;
      case null:
        _appLanguage = _appLanguage == Languages.ar?  Languages.en : Languages.ar;
        break;
    }
    await SharedPref.setLanguage(lang: _appLanguage.name);
    notifyListeners();
  }
}
