import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color_pallete.dart';

///
/// Button/Active/Primary
///
class ButtonActivePrimary {
  final Color elements;
  final Color container;

  ButtonActivePrimary({
    required this.elements,
    required this.container,
  });

  factory ButtonActivePrimary.light(QuiColorPallete p) => ButtonActivePrimary(
        elements: p.grayScale.s0,
        container: p.primary.s50,
      );

  factory ButtonActivePrimary.dark(QuiColorPallete p) => ButtonActivePrimary(
        elements: p.grayScale.s0,
        container: p.primary.s40,
      );
}

///
/// Button/Active/Secondary
///
class ButtonActiveSecondary {
  final Color elements;
  final Color container;

  ButtonActiveSecondary({
    required this.elements,
    required this.container,
  });

  factory ButtonActiveSecondary.light(QuiColorPallete p) =>
      ButtonActiveSecondary(
        elements: p.primary.s99,
        container: p.primary.s10,
      );

  factory ButtonActiveSecondary.dark(QuiColorPallete p) =>
      ButtonActiveSecondary(
        elements: p.primary.s20,
        container: p.primary.s99,
      );
}

///
/// Button/Active/Ghost
///
class ButtonActiveGhost {
  final Color elements;

  ButtonActiveGhost({
    required this.elements,
  });

  factory ButtonActiveGhost.light(QuiColorPallete p) => ButtonActiveGhost(
        elements: p.grayScale.s100,
      );

  factory ButtonActiveGhost.dark(QuiColorPallete p) => ButtonActiveGhost(
        elements: p.grayScale.s0,
      );
}

///
/// Button/Active/Outline
///
class ButtonActiveOutline {
  final Color elements;
  final Color outline;

  ButtonActiveOutline({
    required this.elements,
    required this.outline,
  });

  factory ButtonActiveOutline.light(QuiColorPallete p) => ButtonActiveOutline(
        elements: p.grayScale.s100,
        outline: p.blackColor.s20,
      );

  factory ButtonActiveOutline.dark(QuiColorPallete p) => ButtonActiveOutline(
        elements: p.grayScale.s0,
        outline: p.whiteColor.s70,
      );
}
