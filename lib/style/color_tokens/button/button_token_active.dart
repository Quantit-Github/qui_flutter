import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color_palette.dart';

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

  factory ButtonActivePrimary.light(QuiColorPalette p) => ButtonActivePrimary(
        elements: p.grayScale.s0,
        container: p.primary.s50,
      );

  factory ButtonActivePrimary.dark(QuiColorPalette p) => ButtonActivePrimary(
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

  factory ButtonActiveSecondary.light(QuiColorPalette p) =>
      ButtonActiveSecondary(
        elements: p.primary.s99,
        container: p.primary.s10,
      );

  factory ButtonActiveSecondary.dark(QuiColorPalette p) =>
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

  factory ButtonActiveGhost.light(QuiColorPalette p) => ButtonActiveGhost(
        elements: p.grayScale.s100,
      );

  factory ButtonActiveGhost.dark(QuiColorPalette p) => ButtonActiveGhost(
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

  factory ButtonActiveOutline.light(QuiColorPalette p) => ButtonActiveOutline(
        elements: p.grayScale.s100,
        outline: p.blackColor.s20,
      );

  factory ButtonActiveOutline.dark(QuiColorPalette p) => ButtonActiveOutline(
        elements: p.grayScale.s0,
        outline: p.whiteColor.s70,
      );
}
