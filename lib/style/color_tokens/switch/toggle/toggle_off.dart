import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color_palette.dart';

///
/// Toggle/Off
///
class ToggleOff {
  final Color handle;
  final Color container;
  final QuiColorPalette colorPallete;

  ToggleOff({
    required this.colorPallete,
  })  : handle = colorPallete.grayScale.s0,
        container = colorPallete.grayScale.s30;
}
