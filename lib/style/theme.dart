import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color.dart';
import 'package:qui_flutter/style/palette.dart';
import 'package:qui_flutter/style/typography.dart';

class $QuiTheme {
  $QuiTheme({QuiPalette? palette}) : _palette = palette ?? QuiPalette();

  final QuiPalette _palette;
  QuiPalette get palette => _palette;
  QuiColorPalette operator [](ThemeMode mode) => _palette[mode];
  QuiTextTheme getTextTheme(ThemeMode mode) =>
      QuiTextTheme(color: this[mode].blackColor.s0);

  ThemeData get lightThemeData => getThemeData(ThemeMode.light);
  ThemeData get darkThemeData => getThemeData(ThemeMode.dark);

  ThemeData getThemeData(ThemeMode mode) {
    final QuiColorPalette colorPalette = this[mode];
    final QuiTextTheme textTheme = getTextTheme(mode);

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
