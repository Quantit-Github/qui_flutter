import 'package:flutter/material.dart';
import 'package:qui_flutter/style/base_color/base_color.dart';

///
/// Black Color
///
class BlackColor extends BaseColor {
  BlackColor({
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
          s100: s100 ?? const Color(0xFF101014),
          s99: s99 ?? const Color(0xFF101014).withOpacity(0.9),
          s95: s95 ?? const Color(0xFF101014).withOpacity(0.8),
          s90: s90 ?? const Color(0xFF101014).withOpacity(0.7),
          s80: s80 ?? const Color(0xFF101014).withOpacity(0.6),
          s70: s70 ?? const Color(0xFF101014).withOpacity(0.5),
          s60: s60 ?? const Color(0xFF101014).withOpacity(0.4),
          s50: s50 ?? const Color(0xFF101014).withOpacity(0.3),
          s40: s40 ?? const Color(0xFF101014).withOpacity(0.2),
          s30: s30 ?? const Color(0xFF101014).withOpacity(0.15),
          s20: s20 ?? const Color(0xFF101014).withOpacity(0.06),
          s10: s10 ?? const Color(0xFF101014).withOpacity(0.03),
          s0: s0 ?? const Color(0xFF101014).withOpacity(0),
        );

  @override
  BlackColor copyWith({
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
    return BlackColor(
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
