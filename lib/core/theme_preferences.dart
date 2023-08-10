// Copyright © 2020 Birju Vachhani. All rights reserved.
// Use of this source code is governed by an Apache license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:qui_flutter/core/mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Save theme status in shared preferences
class ThemePreferences {
  static const String _prefKey = 'qui_theme_preferences';

  late QuiThemeMode mode;
  late QuiThemeMode defaultMode;

  ThemePreferences._(this.mode, this.defaultMode);

  ThemePreferences.initial({QuiThemeMode mode = QuiThemeMode.light})
      : this._(mode, mode);

  void reset() => mode = defaultMode;

  ThemePreferences.fromJson(Map<String, dynamic> json) {
    if (json['theme_mode'] != null) {
      mode = QuiThemeMode.values[json['theme_mode']];
    } else {
      mode = QuiThemeMode.light;
    }
    if (json['default_theme_mode'] != null) {
      defaultMode = QuiThemeMode.values[json['default_theme_mode']];
    } else {
      defaultMode = mode;
    }
  }

  Map<String, dynamic> themeToJson() => {
        'theme_mode': mode.index,
        'default_theme_mode': defaultMode.index,
      };

  /// saves the current theme preferences to the shared-preferences
  Future<bool> save() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_prefKey, json.encode(themeToJson()));
  }

  /// retrieves preferences from the shared-preferences
  static Future<ThemePreferences?> fromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeDataString = prefs.getString(_prefKey);
      if (themeDataString == null || themeDataString.isEmpty) return null;
      return ThemePreferences.fromJson(json.decode(themeDataString));
    } on Exception catch (error, stacktrace) {
      if (kDebugMode) {
        log(
          "Qui Theme :: fromPrefs Error",
          error: error,
          stackTrace: stacktrace,
        );
      }
      return null;
    }
  }
}
