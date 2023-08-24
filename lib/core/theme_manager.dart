import 'package:flutter/material.dart';
import 'package:qui_flutter/core/theme_preferences.dart';
import 'package:qui_flutter/style/color_pallete.dart';

mixin QuiThemeManager {
  late final ThemeData _lightTheme;
  late final ThemeData _darkTheme;
  late final ValueNotifier<ThemeMode> _themeMode;
  late final QuiColorPalette _colorPaletteLight;
  late final QuiColorPalette _colorPaletteDark;
  late QuiColorPalette _colorPalette;
  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;
  ValueNotifier<ThemeMode> get themeMode => _themeMode;
  QuiColorPalette get colorPalette => _colorPalette;

  /// 사용자가 커스텀 컬러 팔레트를 설정하는 경우 모드에 따라 변경되지 않고 고정됨.
  /// [QuiColorPalette.lightTheme] + [copyWith] 형태로 설정 가능.
  bool isUseCustomColorPalette = false;

  final QuiThemePreferences store = QuiThemePreferences();

  void initTheme({
    required ThemeMode themeMode,
    required ThemeData light,
    required ThemeData dark,
    QuiColorPalette? colorPaletteLight,
    QuiColorPalette? colorPaletteDark,
  }) {
    _colorPaletteLight = colorPaletteLight ?? QuiColorPalette.lightTheme;
    _colorPaletteDark = colorPaletteDark ?? QuiColorPalette.darkTheme;

    _lightTheme = light;
    _darkTheme = dark;
    _selectColorPallete(themeMode);
    _themeMode = ValueNotifier(themeMode);
  }

  String getThemeMode() {
    return themeMode.value.toString();
  }

  ///
  /// Set theme mode [Dark].
  ///
  void setDarkTheme() {
    const mode = ThemeMode.dark;
    _selectColorPallete(mode);
    _themeMode.value = mode;
    store.setThemeMode(mode);
  }

  ///
  /// Set theme mode [Light].
  ///
  void setLightTheme() {
    const mode = ThemeMode.light;
    _selectColorPallete(mode);
    _themeMode.value = mode;
    store.setThemeMode(mode);
  }

  ///
  /// Set theme mode [System].
  ///
  void setSystemTheme() {
    const mode = ThemeMode.system;
    _selectColorPallete(mode);
    _themeMode.value = mode;
    store.setThemeMode(mode);
  }

  ///
  /// Choose color pallete by theme mode.
  /// [Ligtht] or [Dark] or [UserCustom]
  ///
  void _selectColorPallete(ThemeMode mode) {
    if (isUseCustomColorPalette) return;

    switch (mode) {
      case ThemeMode.light:
        _colorPalette = _colorPaletteLight;
        break;
      case ThemeMode.dark:
        _colorPalette = _colorPaletteDark;
        break;
      case ThemeMode.system:
        _colorPalette =
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                    Brightness.light
                ? _colorPaletteLight
                : _colorPaletteDark;
        break;
    }
  }

  ///
  /// Toggle theme mode.
  /// [Light] -> [Dark] -> [System] infinity loop.
  ///
  void toggleThemeMode() {
    final nextModeIndex =
        (_themeMode.value.index + 1) % ThemeMode.values.length;
    final mode = ThemeMode.values[nextModeIndex];
    _selectColorPallete(mode);
    _themeMode.value = mode;
    store.setThemeMode(_themeMode.value);
  }
}
