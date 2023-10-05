import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color.dart';

class QuiPalette {
  ///
  /// create QuiPalette with ColorPalette
  ///
  /// [light] can be null, if null, use default light color palette
  /// [dark] can be null, if null, use default dark color palette
  ///
  /// when use operator [], if [mode] is null, return [light]
  ///

  QuiPalette({
    QuiColorPalette? light,
    QuiColorPalette? dark,
  }) : _swatch = {
          ThemeMode.light: light ?? LightColorPalette(),
          ThemeMode.dark: dark ?? DarkColorPalette(),
        };

  @protected
  final Map<ThemeMode, QuiColorPalette> _swatch;

  ThemeMode get systemThemeMode {
    if (WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark) {
      return ThemeMode.dark;
    }
    return ThemeMode.light;
  }

  QuiColorPalette operator [](ThemeMode mode) =>
      _swatch[mode] ?? _swatch[systemThemeMode]!;

  QuiColorPalette get light => _swatch[ThemeMode.light]!;
  QuiColorPalette get dark => _swatch[ThemeMode.dark]!;
}
