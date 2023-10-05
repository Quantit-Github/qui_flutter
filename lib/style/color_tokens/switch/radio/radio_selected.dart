import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color_pallete.dart';

class RadioSelected {
  final Color frame;
  final QuiColorPallete colorPallete;

  RadioSelected({
    required this.colorPallete,
  }) : frame = colorPallete.grayScale.s0;
}
