import 'package:qui_flutter/style/color_palette.dart';
import 'package:flutter/material.dart';

///
/// State Overlay Token
///
class StateOverlay {
  final Color common;
  final Color hover;
  final Color pressed;
  final Color focused;

  StateOverlay({
    required this.common,
    required this.hover,
    required this.pressed,
    required this.focused,
  });

  factory StateOverlay.light(QuiColorPalette p) => StateOverlay(
        common: p.blackColor.s0,
        hover: p.blackColor.s0,
        pressed: p.blackColor.s20,
        focused: p.primary.s30,
      );

  factory StateOverlay.dark(QuiColorPalette p) => StateOverlay(
        common: p.whiteColor.s0,
        hover: p.whiteColor.s0,
        pressed: p.whiteColor.s20,
        focused: p.primary.s30,
      );
}
