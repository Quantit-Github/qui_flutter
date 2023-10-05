import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color.dart';
import 'package:qui_flutter/style/palette.dart';
import 'package:qui_flutter/style/theme.dart';
import 'package:qui_flutter/style/typography.dart';

mixin QuiThemeManager {
  late $QuiTheme _theme;
  $QuiTheme get theme => _theme;

  late final ValueNotifier<ThemeMode> _themeMode;
  ValueNotifier<ThemeMode> get themeMode => _themeMode;

  void initTheme({
    required ThemeMode themeMode,
    QuiColorPalette? light,
    QuiColorPalette? dark,
  }) {
    _theme = $QuiTheme(palette: QuiPalette(light: light, dark: dark));
    _themeMode = ValueNotifier(themeMode);
  }

  ///
  /// Set theme mode [Dark].
  ///
  void setDarkTheme() => _themeMode.value = ThemeMode.dark;

  ///
  /// Set theme mode [Light].
  ///
  void setLightTheme() => _themeMode.value = ThemeMode.light;

  ///
  /// Set theme mode [System].
  ///
  void setSystemTheme() => _themeMode.value = ThemeMode.system;

  ///
  /// Toggle theme mode.
  /// [Light] -> [Dark] -> [System] infinity loop.
  ///
  void toggleThemeMode() {
    final nextModeIndex =
        (_themeMode.value.index + 1) % ThemeMode.values.length;
    final mode = ThemeMode.values[nextModeIndex];
    _themeMode.value = mode;
  }

  QuiColorPalette get palette => theme[themeMode.value];
  QuiTextTheme get getTextTheme => theme.getTextTheme(themeMode.value);
}
