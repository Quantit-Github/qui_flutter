import 'package:flutter/material.dart';
import 'package:qui_flutter/core/qui_theme.dart';
import 'package:qui_flutter/style/color.dart';

mixin ButtonPrimaryToken {
  QuiColorPalette get color;

  @protected
  Color get container => color.primary.s70;
  @protected
  Color get elements => color.semanticColor.brightest;
}

class ButtonSecondaryToken {
  const ButtonSecondaryToken(BuildContext context) : this.context = context;
  final BuildContext context;
  Color get container => QuiTheme.of(context).color.primary.s99;
  Color get elements => QuiTheme.of(context).color.primary.s10;
}

class ButtonGhostToken {
  const ButtonGhostToken(BuildContext context) : this.context = context;
  final BuildContext context;
  Color get container => QuiTheme.of(context).color.blackColor.s100;
  Color get elements => QuiTheme.of(context).color.blackColor.s0;
  Color get elementsLighten => QuiTheme.of(context).color.whiteColor.s0;
}

class ButtonCommonLoadingToken {
  const ButtonCommonLoadingToken(BuildContext context) : this.context = context;
  final BuildContext context;
  Color get container => QuiTheme.of(context).color.whiteColor.s80;
  Color get containerVar => QuiTheme.of(context).color.blackColor.s99;
}

mixin ButtonCommonToken {
  QuiColorPalette get color;

  // disabled
  Color get disabledElement => color.blackColor.s70;
  Color get disabledElementLighten => color.whiteColor.s70;
  Color get disabledOutline => color.semanticColor.borderLow;
  Color get disabledContainer => color.blackColor.s95;
  Color get disabledContainerNull => color.blackColor.s100;

  // Loading
  Color get loadingContainer => color.whiteColor.s80;
  Color get loadingContainerVar => color.blackColor.s99;
}
