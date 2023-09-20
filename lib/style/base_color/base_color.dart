import 'package:flutter/material.dart';

///
/// 기본 Color Scale
///
abstract class BaseColor {
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

  BaseColor({
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

  BaseColor copyWith({
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
  });
}

///
/// 컬러값이 3개만 있는 스케일
///
abstract class BaseTripleScale {
  final Color s60;
  final Color s50;
  final Color s40;

  const BaseTripleScale({
    required this.s60,
    required this.s50,
    required this.s40,
  });

  BaseTripleScale copyWith({
    Color? s60,
    Color? s50,
    Color? s40,
  });
}

abstract class BaseSemanticColor {
  final Color brightest;
  final Color borderHigh;
  final Color borderMedium;
  final Color borderLow;
  final Color stateOverlayFocused;
  final Color primaryLighten;

  BaseSemanticColor({
    required this.brightest,
    required this.borderHigh,
    required this.borderMedium,
    required this.borderLow,
    required this.stateOverlayFocused,
    required this.primaryLighten,
  });

  BaseSemanticColor copyWith({
    Color? brightest,
    Color? borderHigh,
    Color? borderMedium,
    Color? borderLow,
    Color? stateOverlayFocused,
    Color? primaryLighten,
  });
}
