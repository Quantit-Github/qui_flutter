import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// Check: shared_preferences를 사용하는것을 우리가 결정하는 것이 맞는지 여부를 논의 해볼 필요가 있음.
///
///
class QuiThemePreferences {
  static const String _prefKey = 'qui_theme_mode';

  setThemeMode(ThemeMode value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(_prefKey, value.toString());
  }

  Future<ThemeMode> getThemeMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final mode = pref.getString(_prefKey) ?? ThemeMode.system.toString();
    return ThemeMode.values.firstWhere((e) => e.toString() == mode);
  }
}
