import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class LocaleService {
  static const String _languageCodeKey = 'language_code';

  static Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageCodeKey, locale.languageCode);
  }

  static Future<Locale> getSavedLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String? langCode = prefs.getString(_languageCodeKey);

    if (langCode != null) {
      return Locale(langCode);
    } else {
      return const Locale('en', 'US'); // default
    }
  }
}
