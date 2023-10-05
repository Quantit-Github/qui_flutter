import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color.dart';
import 'package:qui_flutter/style/palette.dart';

class $QuiTheme {
  $QuiTheme({QuiPalette? palette}) : _palette = palette ?? QuiPalette();

  final QuiPalette _palette;
  QuiPalette get palette => _palette;
  QuiColorPalette operator [](ThemeMode mode) => _palette[mode];

  ThemeData get lightThemeData => getThemeData(ThemeMode.light);
  ThemeData get darkThemeData => getThemeData(ThemeMode.dark);

  ThemeData getThemeData(ThemeMode mode) {
    final QuiColorPalette colorPalette = _palette[mode];
    final QuiTextTheme textTheme =
        QuiTextTheme(color: colorPalette.blackColor.s0);

    // TODO: Add more theme data
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: colorPalette.primary.s50,
      splashColor: Colors.transparent,
      fontFamily: "Pretendard",
      textTheme: textTheme,
      focusColor: colorPalette.primary.s30,
      highlightColor: colorPalette.whiteColor.s20,
      shadowColor: Colors.transparent,
      scaffoldBackgroundColor: colorPalette.whiteColor.s0,
      appBarTheme: AppBarTheme(
        backgroundColor: colorPalette.whiteColor.s0,
        foregroundColor: colorPalette.blackColor.s0,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.headlineMedium,
        iconTheme: IconThemeData(
          color: colorPalette.blackColor.s0,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorPalette.primary.s90,
        foregroundColor: colorPalette.blackColor.s0,
      ),
    );
  }
}

class QuiTextTheme extends TextTheme {
  QuiTextTheme({required Color color})
      : super(
          displayLarge: TextStyle(
            fontSize: 56,
            height: 64 / 56,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          displayMedium: TextStyle(
            fontSize: 44,
            height: 52 / 44,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          displaySmall: TextStyle(
            fontSize: 36,
            height: 44 / 36,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            height: 40 / 32,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: TextStyle(
            fontSize: 28,
            height: 36 / 28,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            height: 32 / 24,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            height: 28 / 22,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            height: 26 / 20,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          titleSmall: TextStyle(
            fontSize: 18,
            height: 24 / 18,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            height: 24 / 16,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            height: 20 / 14,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            height: 16 / 12,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            height: 20 / 14,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            height: 16 / 12,
            color: color,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            height: 14 / 10,
            color: color,
            fontWeight: FontWeight.w400,
          ),
        );
}

extension TextThemeExtension on TextTheme {
  TextStyle get displayLargeBold =>
      displayLarge!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get displayMediumBold =>
      displayMedium!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get displaySmallBold =>
      displaySmall!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get headlineLargeBold =>
      headlineLarge!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get headlineMediumBold =>
      headlineMedium!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get headlineSmallBold =>
      headlineSmall!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get titleLargeBold =>
      titleLarge!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get titleMediumBold =>
      titleMedium!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get bodyLargeBold =>
      bodyLarge!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get bodyLargeBoldUnderlined => bodyLarge!.copyWith(
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
      );
  TextStyle get bodyMediumBold =>
      bodyMedium!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get bodyMediumBoldUnderlined => bodyMedium!.copyWith(
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
      );
  TextStyle get bodySmallBold =>
      bodySmall!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get labelLargeBold =>
      labelLarge!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get labelMediumBold =>
      labelMedium!.copyWith(fontWeight: FontWeight.w700);
  TextStyle get labelSmallBold =>
      labelSmall!.copyWith(fontWeight: FontWeight.w700);
}
