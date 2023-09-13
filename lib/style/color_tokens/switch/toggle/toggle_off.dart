import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color_pallete.dart';

///
/// Toggle/Off
///
class ToggleOff {
  final Color handle;
  final Color container;
  final QuiColorPallete colorPallete;

  ToggleOff({
    required this.colorPallete,
  })  : handle = colorPallete.grayScale.s0,
        container = colorPallete.grayScale.s30;
}
