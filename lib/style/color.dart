import 'package:flutter/material.dart';

class ColorRange {
  /// {@template ColorRange}
  /// Creates ColorRange
  ///
  /// [s0], [s10], [s20], [s30], [s40], [s50], [s60], [s70], [s80], [s90], [s95], [s99], [s100] must not be null.
  ///
  /// [s0] is the darkest color in the range.
  /// [s100] is the lightest color in the range.
  ///
  /// [copyWith] can be used to override the default values of the color range.
  /// {@endtemplate}

  final Color s0;
  final Color s10;
  final Color s20;
  final Color s30;
  final Color s40;
  final Color s50;
  final Color s60;
  final Color s70;
  final Color s80;
  final Color s90;
  final Color s95;
  final Color s99;
  final Color s100;

  ColorRange({
    required this.s0,
    required this.s10,
    required this.s20,
    required this.s30,
    required this.s40,
    required this.s50,
    required this.s60,
    required this.s70,
    required this.s80,
    required this.s90,
    required this.s95,
    required this.s99,
    required this.s100,
  });
}

extension ColorRangeCopyWith on ColorRange {
  ColorRange copyWith({
    Color? s0,
    Color? s10,
    Color? s20,
    Color? s30,
    Color? s40,
    Color? s50,
    Color? s60,
    Color? s70,
    Color? s80,
    Color? s90,
    Color? s95,
    Color? s99,
    Color? s100,
  }) {
    return ColorRange(
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

class OpacityColorRange extends ColorRange {
  ///
  /// Creates BlackColor
  ///
  /// creates a [ColorRange] with [Color] as the base color.
  /// [color] must not be null.
  ///
  /// Inherits [ColorRange]
  /// {@macro ColorRange}

  OpacityColorRange({
    required Color color,
  }) : super(
          s0: color,
          s10: color.withOpacity(0.9),
          s20: color.withOpacity(0.8),
          s30: color.withOpacity(0.7),
          s40: color.withOpacity(0.6),
          s50: color.withOpacity(0.5),
          s60: color.withOpacity(0.4),
          s70: color.withOpacity(0.3),
          s80: color.withOpacity(0.2),
          s90: color.withOpacity(0.15),
          s95: color.withOpacity(0.06),
          s99: color.withOpacity(0.03),
          s100: color.withOpacity(0),
        );
}

class SemanticColor {
  ///
  /// Creates SemanticColor
  ///
  /// [brightest], [borderHigh], [borderMedium], [borderLow], [stateOverlayFocused], [primaryLighten] must not be null.
  ///
  ///

  final Color brightest;
  final Color borderHigh;
  final Color borderMedium;
  final Color borderLow;
  final Color stateOverlayFocused;
  final Color primaryLighten;

  SemanticColor({
    required this.brightest,
    required this.borderHigh,
    required this.borderMedium,
    required this.borderLow,
    required this.stateOverlayFocused,
    required this.primaryLighten,
  });
}

extension SemanticColorCopyWith on SemanticColor {
  SemanticColor copyWith({
    Color? brightest,
    Color? borderHigh,
    Color? borderMedium,
    Color? borderLow,
    Color? stateOverlayFocused,
    Color? primaryLighten,
  }) {
    return SemanticColor(
      brightest: brightest ?? this.brightest,
      borderHigh: borderHigh ?? this.borderHigh,
      borderMedium: borderMedium ?? this.borderMedium,
      borderLow: borderLow ?? this.borderLow,
      stateOverlayFocused: stateOverlayFocused ?? this.stateOverlayFocused,
      primaryLighten: primaryLighten ?? this.primaryLighten,
    );
  }
}

class QuiColorPalette {
  final ColorRange primary;
  final ColorRange grayScale;
  final ColorRange blackColor;
  final ColorRange whiteColor;
  final SemanticColor semanticColor;

  QuiColorPalette({
    required this.primary,
    required this.grayScale,
    required this.blackColor,
    required this.whiteColor,
    required this.semanticColor,
  });

  factory QuiColorPalette.light() => LightColorPalette();
  factory QuiColorPalette.dark() => DarkColorPalette();
}

extension QuiColorPaletteCopyWith on QuiColorPalette {
  QuiColorPalette copyWith({
    ColorRange? primary,
    ColorRange? grayScale,
    ColorRange? blackColor,
    ColorRange? whiteColor,
    SemanticColor? semanticColor,
  }) {
    return QuiColorPalette(
      primary: primary ?? this.primary,
      grayScale: grayScale ?? this.grayScale,
      blackColor: blackColor ?? this.blackColor,
      whiteColor: whiteColor ?? this.whiteColor,
      semanticColor: semanticColor ?? this.semanticColor,
    );
  }
}

/// Light Color Palette

class LightPrimary implements ColorRange {
  @override
  Color s0 = const Color(0xFF040518);
  @override
  Color s10 = const Color(0xFF090A2F);
  @override
  Color s20 = const Color(0xFF0D0F47);
  @override
  Color s30 = const Color(0xFF11145E);
  @override
  Color s40 = const Color(0xFF1A1D8E);
  @override
  Color s50 = const Color(0xFF2227BD);
  @override
  Color s60 = const Color(0xFF2B31EC);
  @override
  Color s70 = const Color(0xFF3355FF);
  @override
  Color s80 = const Color(0xFF5B8FFF);
  @override
  Color s90 = const Color(0xFF8AB5FF);
  @override
  Color s95 = const Color(0xFFBAD4FF);
  @override
  Color s99 = const Color(0xFFD8E2FA);
  @override
  Color s100 = const Color(0xFFF2F6FA);
}

class LightGrayScale implements ColorRange {
  @override
  Color s0 = const Color(0xFF1B1D20);
  @override
  Color s10 = const Color(0xFF3D3F45);
  @override
  Color s20 = const Color(0xFF525559);
  @override
  Color s30 = const Color(0xFF686A6E);
  @override
  Color s40 = const Color(0xFF7D7F83);
  @override
  Color s50 = const Color(0xFF939597);
  @override
  Color s60 = const Color(0xFFA9AAAC);
  @override
  Color s70 = const Color(0xFFBEBFC1);
  @override
  Color s80 = const Color(0xFFD4D4D6);
  @override
  Color s90 = const Color(0xFFE9EAEA);
  @override
  Color s95 = const Color(0xFFF4F4F5);
  @override
  Color s99 = const Color(0xFFF9F9F9);
  @override
  Color s100 = const Color(0xFFFDFDFD);
}

class LightSemanticColor implements SemanticColor {
  @override
  Color brightest = const Color(0xFFFDFDFD);
  @override
  Color borderHigh = const Color(0xFF101014).withOpacity(0.8);
  @override
  Color borderMedium = const Color(0xFF101014).withOpacity(0.15);
  @override
  Color borderLow = const Color(0xFF101014).withOpacity(0.06);
  @override
  Color stateOverlayFocused = const Color(0xFFBAD4FF);
  @override
  Color primaryLighten = const Color(0xFF2B31EC);
}

class LightColorPalette implements QuiColorPalette {
  @override
  LightPrimary primary = LightPrimary();
  @override
  LightGrayScale grayScale = LightGrayScale();
  @override
  ColorRange blackColor = OpacityColorRange(color: const Color(0xFF101014));
  @override
  ColorRange whiteColor = OpacityColorRange(color: const Color(0xFFF3F6FD));
  @override
  LightSemanticColor semanticColor = LightSemanticColor();
}

/// Dark Color Palette

class DarkPrimary implements ColorRange {
  @override
  Color s0 = const Color(0xFFF2F6FA);
  @override
  Color s10 = const Color(0xFFD8E2FA);
  @override
  Color s20 = const Color(0xFFBAD4FF);
  @override
  Color s30 = const Color(0xFF8AB5FF);
  @override
  Color s40 = const Color(0xFF5B8FFF);
  @override
  Color s50 = const Color(0xFF3355FF);
  @override
  Color s60 = const Color(0xFF2B31EC);
  @override
  Color s70 = const Color(0xFF2227BD);
  @override
  Color s80 = const Color(0xFF1A1D8E);
  @override
  Color s90 = const Color(0xFF11145E);
  @override
  Color s95 = const Color(0xFF0D0F47);
  @override
  Color s99 = const Color(0xFF090A2F);
  @override
  Color s100 = const Color(0xFF040518);
}

class DarkGrayScale implements ColorRange {
  @override
  Color s0 = const Color(0xFFFDFDFD);
  @override
  Color s10 = const Color(0xFFF9F9F9);
  @override
  Color s20 = const Color(0xFFF4F4F5);
  @override
  Color s30 = const Color(0xFFE9EAEA);
  @override
  Color s40 = const Color(0xFFD4D4D6);
  @override
  Color s50 = const Color(0xFFBEBFC1);
  @override
  Color s60 = const Color(0xFFA9AAAC);
  @override
  Color s70 = const Color(0xFF939597);
  @override
  Color s80 = const Color(0xFF7D7F83);
  @override
  Color s90 = const Color(0xFF686A6E);
  @override
  Color s95 = const Color(0xFF525559);
  @override
  Color s99 = const Color(0xFF3D3F45);
  @override
  Color s100 = const Color(0xFF1B1D20);
}

class DarkSemanticColor implements SemanticColor {
  @override
  Color brightest = const Color(0xFFFDFDFD);
  @override
  Color borderHigh = const Color(0xFFF9FAFD).withOpacity(0.8);
  @override
  Color borderMedium = const Color(0xFFF9FAFD).withOpacity(0.15);
  @override
  Color borderLow = const Color(0xFFF9FAFD).withOpacity(0.06);
  @override
  Color stateOverlayFocused = const Color(0xFFBAD4FF);
  @override
  Color primaryLighten = const Color(0xFF8AB5FF);
}

class DarkColorPalette implements QuiColorPalette {
  @override
  DarkPrimary primary = DarkPrimary();
  @override
  DarkGrayScale grayScale = DarkGrayScale();
  @override
  ColorRange blackColor = OpacityColorRange(color: const Color(0xFFF9FAFD));
  @override
  ColorRange whiteColor = OpacityColorRange(color: const Color(0xFF101014));
  @override
  DarkSemanticColor semanticColor = DarkSemanticColor();
}
