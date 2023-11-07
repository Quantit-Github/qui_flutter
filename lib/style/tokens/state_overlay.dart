import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color.dart';

mixin ButtonStateOverlayToken {
  QuiColorPalette get color;
  Color get selected => color.primary.s99;
  Color get focused => color.semanticColor.stateOverlayFocused;
  Color get pressed => color.blackColor.s95;
  Color get pressedLighten => color.whiteColor.s95;
  Color get hover => color.blackColor.s99;
  Color get hoverLighten => color.whiteColor.s99;
}
