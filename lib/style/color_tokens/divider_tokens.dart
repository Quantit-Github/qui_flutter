import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color_pallete.dart';

class DividerTokens {
  final QuiColorPallete cp;
  final Color darken;
  final Color lighten;

  DividerTokens({
    required this.cp,
  })  : darken = cp.semanticColor.borderLow,
        lighten = cp.semanticColor.borderMedium;
}
