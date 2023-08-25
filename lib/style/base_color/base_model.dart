import 'package:flutter/material.dart';

///
/// Model 정의
///
class BaseColorPair {
  final Color light;
  final Color dark;

  BaseColorPair({
    required this.light,
    required this.dark,
  });
}

class BaseColorRangeModel {
  final Color s100;
  final Color s99;
  final Color s95;
  final Color s90;
  final Color s80;
  final Color s70;
  final Color s60;
  final Color s50;
  final Color s40;
  final Color s30;
  final Color s20;
  final Color s10;
  final Color s0;

  BaseColorRangeModel({
    required this.s100,
    required this.s99,
    required this.s95,
    required this.s90,
    required this.s80,
    required this.s70,
    required this.s60,
    required this.s50,
    required this.s40,
    required this.s30,
    required this.s20,
    required this.s10,
    required this.s0,
  });

  BaseColorRangeModel copyWith({
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
    return BaseColorRangeModel(
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
