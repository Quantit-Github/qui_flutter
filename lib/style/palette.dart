// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/foundation.dart';
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
  })  : _swatch = {
          ThemeMode.light: light ?? QuiColorPalette.light(),
          ThemeMode.dark: dark ?? QuiColorPalette.dark(),
        },
        assert(
            listEquals(light?.extention?.keys.toList() ?? [],
                dark?.extention?.keys.toList() ?? []),
            "light and dark extention keys must be same");

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
