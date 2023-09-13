import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color_pallete.dart';

///
/// (Switch common token)
/// Switch/Disabled
///
class SwitchDisabled {
  final Color handle;
  final Color container;
  final Color icon;
  final Color label;
  final Color outline;
  final QuiColorPallete colorPallete;

  SwitchDisabled({
    required this.colorPallete,
  })  : handle = colorPallete.grayScale.s0,
        container = colorPallete.blackColor.s30,
        icon = colorPallete.grayScale.s50,
        label = colorPallete.blackColor.s40,
        outline = colorPallete.grayScale.s30;
}
