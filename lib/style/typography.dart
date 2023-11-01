import 'package:flutter/material.dart';

class QuiTextStyle extends TextStyle {
  const QuiTextStyle({
    required double fontSize,
    required double height,
    required Color color,
  }) : super(
          fontSize: fontSize,
          height: height / fontSize,
          color: color,
          fontWeight: FontWeight.w400,
        );
}

class QuiTypography extends TextTheme {
  final TextStyle _displayLarge;
  final TextStyle _displayMedium;
  final TextStyle _displaySmall;
  final TextStyle _headlineLarge;
  final TextStyle _headlineMedium;
  final TextStyle _headlineSmall;
  final TextStyle _titleLarge;
  final TextStyle _titleMedium;
  final TextStyle _titleSmall;
  final TextStyle _bodyLarge;
  final TextStyle _bodyMedium;
  final TextStyle _bodySmall;
  final TextStyle _labelLarge;
  final TextStyle _labelMedium;
  final TextStyle _labelSmall;

  QuiTypography({required Color color})
      : _displayLarge = QuiTextStyle(fontSize: 56, height: 64, color: color),
        _displayMedium = QuiTextStyle(fontSize: 44, height: 52, color: color),
        _displaySmall = QuiTextStyle(fontSize: 36, height: 44, color: color),
        _headlineLarge = QuiTextStyle(fontSize: 32, height: 40, color: color),
        _headlineMedium = QuiTextStyle(fontSize: 28, height: 36, color: color),
        _headlineSmall = QuiTextStyle(fontSize: 24, height: 32, color: color),
        _titleLarge = QuiTextStyle(fontSize: 22, height: 28, color: color),
        _titleMedium = QuiTextStyle(fontSize: 20, height: 26, color: color),
        _titleSmall = QuiTextStyle(fontSize: 18, height: 24, color: color),
        _bodyLarge = QuiTextStyle(fontSize: 16, height: 24, color: color),
        _bodyMedium = QuiTextStyle(fontSize: 14, height: 20, color: color),
        _bodySmall = QuiTextStyle(fontSize: 12, height: 16, color: color),
        _labelLarge = QuiTextStyle(fontSize: 14, height: 20, color: color),
        _labelMedium = QuiTextStyle(fontSize: 12, height: 16, color: color),
        _labelSmall = QuiTextStyle(fontSize: 10, height: 14, color: color);

  @override
  TextStyle get displayLarge => _displayLarge;
  @override
  TextStyle get displayMedium => _displayMedium;
  @override
  TextStyle get displaySmall => _displaySmall;
  @override
  TextStyle get headlineLarge => _headlineLarge;
  @override
  TextStyle get headlineMedium => _headlineMedium;
  @override
  TextStyle get headlineSmall => _headlineSmall;
  @override
  TextStyle get titleLarge => _titleLarge;
  @override
  TextStyle get titleMedium => _titleMedium;
  @override
  TextStyle get titleSmall => _titleSmall;
  @override
  TextStyle get bodyLarge => _bodyLarge;
  @override
  TextStyle get bodyMedium => _bodyMedium;
  @override
  TextStyle get bodySmall => _bodySmall;
  @override
  TextStyle get labelLarge => _labelLarge;
  @override
  TextStyle get labelMedium => _labelMedium;
  @override
  TextStyle get labelSmall => _labelSmall;
}

extension TextStyleExtension on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get underlined => copyWith(decoration: TextDecoration.underline);
  TextStyle get boldUnderlined => copyWith(
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
      );
}
