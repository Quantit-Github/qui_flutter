import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color_palette.dart';

///
/// Toggle/On
///
class ToggleOn {
  final Color handle;
  final Color container;
  final QuiColorPalette colorPallete;

  ToggleOn({
    required this.colorPallete,
  })  : handle = colorPallete.grayScale.s0,
        container = colorPallete.grayScale.s100;
}
