import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color.dart';
import 'package:qui_flutter/style/palette.dart';

class $QuiTheme {
  $QuiTheme({QuiPalette? palette}) : _palette = palette ?? QuiPalette();

  final QuiPalette _palette;
  QuiPalette get palette => _palette;
  QuiColorPalette operator [](ThemeMode mode) => _palette[mode];
}
