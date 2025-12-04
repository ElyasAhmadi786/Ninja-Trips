import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trips/utils/language_manager.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  String _language = 'en';

  ThemeMode get themeMode => _themeMode;
  String get language => _language;

  AppProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme_mode') ?? 'light';
    _language = prefs.getString('language') ?? 'en';

    LanguageManager.currentLanguage = _language;

    _themeMode = theme == 'dark' ? ThemeMode.dark :
    theme == 'system' ? ThemeMode.system : ThemeMode.light;

    notifyListeners();
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme_mode',
        mode == ThemeMode.dark ? 'dark' :
        mode == ThemeMode.system ? 'system' : 'light');
    notifyListeners();
  }

  Future<void> changeLanguage(String lang) async {
    _language = lang;
    LanguageManager.changeLanguage(lang);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
    notifyListeners();
  }

  bool get isDarkMode => _themeMode == ThemeMode.dark;
  bool get isSystemTheme => _themeMode == ThemeMode.system;
}