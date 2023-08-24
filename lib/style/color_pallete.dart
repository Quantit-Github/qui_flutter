import 'package:flutter/material.dart';

class QuiColorPalette {
  final Color primaryColor;
  final Color accentColor;
  final Color backgroundColor;
  final Color textColor;

  QuiColorPalette({
    required this.primaryColor,
    required this.accentColor,
    required this.backgroundColor,
    required this.textColor,
  });

  QuiColorPalette copyWith({
    Color? primaryColor,
    Color? accentColor,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return QuiColorPalette(
      primaryColor: primaryColor ?? this.primaryColor,
      accentColor: accentColor ?? this.accentColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  static QuiColorPalette get lightTheme => QuiColorPalette(
        primaryColor: Colors.blue,
        accentColor: Colors.amber,
        backgroundColor: Colors.white,
        textColor: Colors.black,
      );

  static QuiColorPalette get darkTheme => QuiColorPalette(
        primaryColor: Colors.redAccent,
        accentColor: Colors.green,
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );

  // 여기에 추가적인 컬러값들을 정의하세요.
}
