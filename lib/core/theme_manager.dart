import 'package:flutter/material.dart';
import 'package:qui_flutter/core/theme_preferences.dart';
import 'package:qui_flutter/style/color_palette.dart';
import 'package:qui_flutter/style/color_tokens/color_tokens.dart';

mixin QuiThemeManager {
  late final ValueNotifier<ThemeMode> _themeMode;
  late QuiColorPalette _colorPalette;
  ValueNotifier<ThemeMode> get themeMode => _themeMode;
  QuiColorPalette get colorPalette => _colorPalette;
  QuiColorTokens get colorTokens => QuiColorTokens(
        isDark: isDark(),
        cp: _colorPalette,
      );

  /// 사용자가 커스텀 컬러 팔레트를 설정하는 경우 모드에 따라 변경되지 않고 고정됨.
  /// [QuiColorPalette.lightTheme] + [copyWith] 형태로 설정 가능.
  bool isUseCustomColorPalette = false;

  final QuiThemePreferences store = QuiThemePreferences();

  void initTheme({
    required ThemeMode themeMode,
    QuiColorPalette? colorPalette,
  }) {
    _colorPalette = colorPalette ?? QuiColorPalette();
    _selectColorPalette(themeMode);
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
    _selectColorPalette(mode);
    _themeMode.value = mode;
    store.setThemeMode(mode);
  }

  ///
  /// Set theme mode [Light].
  ///
  void setLightTheme() {
    const mode = ThemeMode.light;
    _selectColorPalette(mode);
    _themeMode.value = mode;
    store.setThemeMode(mode);
  }

  ///
  /// Set theme mode [System].
  ///
  void setSystemTheme() {
    const mode = ThemeMode.system;
    _selectColorPalette(mode);
    _themeMode.value = mode;
    store.setThemeMode(mode);
  }

  ///
  /// Choose color palette by theme mode.
  /// [Light] or [Dark] or [UserCustom]
  ///
  void _selectColorPalette(ThemeMode mode) {
    // if (isUseCustomColorPalette) return;

    // switch (mode) {
    //   case ThemeMode.light:
    //     _colorPalette = _colorPaletteLight;
    //     break;
    //   case ThemeMode.dark:
    //     _colorPalette = _colorPaletteDark;
    //     break;
    //   case ThemeMode.system:
    //     _colorPalette =
    //         WidgetsBinding.instance.platformDispatcher.platformBrightness ==
    //                 Brightness.light
    //             ? _colorPaletteLight
    //             : _colorPaletteDark;
    //     break;
    // }
  }

  ///
  /// Toggle theme mode.
  /// [Light] -> [Dark] -> [System] infinity loop.
  ///
  void toggleThemeMode() {
    final nextModeIndex =
        (_themeMode.value.index + 1) % ThemeMode.values.length;
    final mode = ThemeMode.values[nextModeIndex];
    _selectColorPalette(mode);
    _themeMode.value = mode;
    store.setThemeMode(_themeMode.value);
  }

  bool isDark() {
    switch (_themeMode.value) {
      case ThemeMode.light:
        return false;
      case ThemeMode.dark:
        return true;
      case ThemeMode.system:
        return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    }
  }
}
