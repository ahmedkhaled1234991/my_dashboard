import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences get prefs => GetIt.instance.get<SharedPreferences>();
  static const String _language = "language_code";
  static const String _temperatureKey = "temperature";
  static const String _settingScreenKey = "settingScreen";

  static String? getLanguage() {
    return prefs.getString(_language);
  }

  static Future<void> setLanguage({required String lang}) async {
    await prefs.setString(_language, lang);
  }

  static String? getTemperature() {
    String? result = prefs.getString(_temperatureKey);
    if (result == null || !result.contains(":")) return null;
    DateTime savedTemperatureDate = DateTime.parse(result.split(":").first);
    String savedTemperatureValue = result.split(":").last;

    if (DateTime.now()
        .isAfter(savedTemperatureDate.add(const Duration(hours: 6)))) {
      return null;
    }
    return savedTemperatureValue;
  }

  static Future<void> setTemperature({required String temperature}) async {
    await prefs.setString(
        _temperatureKey, "${DateTime.now().toIso8601String()}:$temperature");
  }

  static Future<void> setSettingsScreenType({required int screenType}) async {
    await prefs.setInt(_settingScreenKey, screenType);
  }

  static int? getSettingsScreenType() {
    return prefs.getInt(_settingScreenKey);
  }

  static Future<void> clearSettingsScreenType() async {
    await prefs.remove(_settingScreenKey);
  }
}
