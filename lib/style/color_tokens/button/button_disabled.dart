import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color_pallete.dart';

///
/// Button/Disabled
///
class ButtonActiveDisabled {
  final Color elements;
  final Color container;

  ButtonActiveDisabled({
    required this.elements,
    required this.container,
  });

  factory ButtonActiveDisabled.light(QuiColorPallete p) => ButtonActiveDisabled(
        elements: p.grayScale.s50,
        container: p.blackColor.s20,
      );

  factory ButtonActiveDisabled.dark(QuiColorPallete p) => ButtonActiveDisabled(
        elements: p.grayScale.s95,
        container: p.whiteColor.s20,
      );
}
