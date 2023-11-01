import 'package:flutter/material.dart';
import 'package:qui_flutter/style/typography.dart';

class ColorRange extends Color {
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
  }) : super(s0.value);

  factory ColorRange.withOpacity({required Color color}) => ColorRange(
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

  const SemanticColor({
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
  const QuiColorPalette({
    required this.primary,
    required this.grayScale,
    required this.blackColor,
    required this.whiteColor,
    required this.semanticColor,
    this.extension,
  });

  final ColorRange primary;
  final ColorRange grayScale;
  final ColorRange blackColor;
  final ColorRange whiteColor;
  final SemanticColor semanticColor;

  QuiColorPalette copyWith({
    ColorRange? primary,
    ColorRange? grayScale,
    ColorRange? blackColor,
    ColorRange? whiteColor,
    SemanticColor? semanticColor,
    Map<String, ColorRange>? extension,
  }) {
    return QuiColorPalette(
      primary: primary ?? this.primary,
      grayScale: grayScale ?? this.grayScale,
      blackColor: blackColor ?? this.blackColor,
      whiteColor: whiteColor ?? this.whiteColor,
      semanticColor: semanticColor ?? this.semanticColor,
      extension: extension ?? this.extension,
    );
  }

  @protected
  final Map<String, ColorRange>? extension;
  ColorRange? operator [](String key) => extension?[key];

  QuiTypography get typography => QuiTypography(color: blackColor);
  ThemeData get themeData {
    final QuiTypography _typography = typography;

    // TODO: Add more theme data
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primary.s50,
      splashColor: Colors.transparent,
      fontFamily: "Pretendard",
      textTheme: _typography,
      focusColor: primary.s30,
      highlightColor: whiteColor.s20,
      shadowColor: Colors.transparent,
      scaffoldBackgroundColor: whiteColor.s0,
      appBarTheme: AppBarTheme(
        backgroundColor: whiteColor.s0,
        foregroundColor: blackColor.s0,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: _typography.headlineMedium,
        iconTheme: IconThemeData(
          color: blackColor.s0,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary.s90,
        foregroundColor: blackColor.s0,
      ),
    );
  }
}
