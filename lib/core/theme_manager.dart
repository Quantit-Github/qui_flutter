// Copyright © 2020 Birju Vachhani. All rights reserved.
// Use of this source code is governed by an Apache license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:qui_flutter/core/mode.dart';

import 'theme_preferences.dart';

/// Entry point to change/modify theme or access theme related information
/// from [QuiTheme].
/// An instance of this can be retrieved by calling [QuiTheme.of].
mixin QuiThemeManager<T extends Object> {
  late T _lightTheme;
  late T _darkTheme;
  late ThemePreferences _preferences;
  late ValueNotifier<QuiThemeMode> _modeChangeNotifier;

  ///
  /// Theme Setting
  /// MEMO: 결국 light 테마값 또한 동일함.
  ///
  T get theme {
    if (_preferences.mode.isSystem) {
      return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.light
          ? _lightTheme
          : _darkTheme;
    } else {
      return _preferences.mode.isDark ? _darkTheme : _lightTheme;
    }
  }

  /// provides the light theme
  T get lightTheme => _lightTheme;

  /// provides the dark theme
  T get darkTheme => _darkTheme;

  /// Returns current theme mode
  QuiThemeMode get mode => _preferences.mode;

  /// Returns the default(initial) theme mode
  QuiThemeMode get defaultMode => _preferences.defaultMode;

  /// Allows to listen to changes in them mode.
  ValueNotifier<QuiThemeMode> get modeChangeNotifier => _modeChangeNotifier;

  /// checks whether current theme is default theme or not. Default theme
  /// refers to he themes provided at the time of initialization
  /// of [MaterialApp].
  bool get isDefault;

  /// provides brightness of the current theme
  Brightness? get brightness;

  void initializeTheme({
    required T light,
    required T dark,
    required QuiThemeMode initial,
  }) {
    _lightTheme = light;
    _modeChangeNotifier = ValueNotifier(initial);
    _darkTheme = dark;
    _preferences = ThemePreferences.initial(mode: initial);

    ThemePreferences.fromPrefs().then((pref) {
      if (pref == null) {
        _preferences.save();
      } else {
        _preferences = pref;
        updateState();
      }
    });
  }

  /// Sets light theme as current
  /// Uses [QuiThemeMode.light].
  void setLight() => setThemeMode(QuiThemeMode.light);

  /// Sets dark theme as current
  /// Uses [QuiThemeMode.dark].
  void setDark() => setThemeMode(QuiThemeMode.dark);

  /// Sets theme based on the theme of the underlying OS.
  /// Uses [QuiThemeMode.system].
  void setSystem() => setThemeMode(QuiThemeMode.system);

  /// Allows to set/change theme mode.
  void setThemeMode(QuiThemeMode mode) {
    _preferences.mode = mode;
    updateState();
    _modeChangeNotifier.value = mode;
    _preferences.save();
  }

  /// Allows to set/change the entire theme.
  /// [notify] when set to true, will update the UI to use the new theme..
  void setTheme({
    required T light,
    T? dark,
    bool notify = true,
  }) {
    _lightTheme = light;
    if (dark != null) _darkTheme = dark;
    if (notify) updateState();
  }

  /// Allows to toggle between theme modes [QuiThemeMode.light],
  /// [QuiThemeMode.dark] and [QuiThemeMode.system].
  void toggleThemeMode() {
    final nextModeIndex = (mode.index + 1) % QuiThemeMode.values.length;
    final nextMode = QuiThemeMode.values[nextModeIndex];
    setThemeMode(nextMode);
  }

  /// Saves the configuration to the shared-preferences. This can be useful
  /// when you want to persist theme settings after clearing
  /// shared-preferences. e.g. when user logs out, usually, preferences
  /// are cleared. Call this method after clearing preferences to
  /// persist theme mode.
  Future<bool> persist() async => _preferences.save();

  /// Resets configuration to default configuration which has been provided
  /// while initializing [MaterialApp].
  /// If [setTheme] method has been called with [isDefault] to true, Calling
  /// this method afterwards will use theme provided by [setTheme] as default
  /// themes.
  /// Implementations of this method should end with a call to the inherited
  /// method, as in `super.reset()`.
  @mustCallSuper
  Future<bool> reset() async {
    _preferences.reset();
    updateState();
    modeChangeNotifier.value = mode;
    return _preferences.save();
  }

  void updateState();
}
