import 'package:flutter/material.dart';
import 'package:qui_flutter/style/base_color/base_color.dart';

///
/// Graycale Color
///
class GrayScale extends BaseColor {
  GrayScale({
    Color? s100,
    Color? s99,
    Color? s95,
    Color? s90,
    Color? s80,
    Color? s70,
    Color? s60,
    Color? s50,
    Color? s40,
    Color? s30,
    Color? s20,
    Color? s10,
    Color? s0,
  }) : super(
          s100: const Color(0xFF1B1D20),
          s99: const Color(0xFF3D3F45),
          s95: const Color(0xFF525559),
          s90: const Color(0xFF686A6E),
          s80: const Color(0xFF7D7F83),
          s70: const Color(0xFF939597),
          s60: const Color(0xFFA9AAAC),
          s50: const Color(0xFFBEBFC1),
          s40: const Color(0xFFD4D4D6),
          s30: const Color(0xFFE9EAEA),
          s20: const Color(0xFFF4F4F5),
          s10: const Color(0xFFF9F9F9),
          s0: const Color(0xFFFDFDFD),
        );

  @override
  GrayScale copyWith({
    Color? s100,
    Color? s99,
    Color? s95,
    Color? s90,
    Color? s80,
    Color? s70,
    Color? s60,
    Color? s50,
    Color? s40,
    Color? s30,
    Color? s20,
    Color? s10,
    Color? s0,
  }) {
    return GrayScale(
      s100: s100 ?? this.s100,
      s99: s99 ?? this.s99,
      s95: s95 ?? this.s95,
      s90: s90 ?? this.s90,
      s80: s80 ?? this.s80,
      s70: s70 ?? this.s70,
      s60: s60 ?? this.s60,
      s50: s50 ?? this.s50,
      s40: s40 ?? this.s40,
      s30: s30 ?? this.s30,
      s20: s20 ?? this.s20,
      s10: s10 ?? this.s10,
      s0: s0 ?? this.s0,
    );
  }
}
