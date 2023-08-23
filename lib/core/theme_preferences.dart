import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuiThemePreferences {
  static const String _prefKey = 'qui_theme_mode';

  setThemeMode(ThemeMode value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_prefKey, value.toString());
  }

  Future<ThemeMode> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final mode = prefs.getString(_prefKey) ?? ThemeMode.system.toString();
    return ThemeMode.values.firstWhere((e) => e.toString() == mode);
  }
}
