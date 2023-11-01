import 'package:flutter/material.dart';
import 'package:qui_flutter/core/theme_manager.dart';
import 'package:qui_flutter/style/color.dart';
import 'package:qui_flutter/style/typography.dart';

///
/// Material App builder with custom theme.
///
typedef ThemeBuilder = Widget Function(
  ThemeData light,
  ThemeData dark,
  ThemeMode mode,
);

///
/// Custom theme widget.
///
class QuiTheme extends StatefulWidget {
  /// Default value [ThemeMode.system]
  final ThemeMode initialThemeMode;

  /// [builder] function define.
  final ThemeBuilder builder;

  /// [light] define.
  final QuiColorPalette? light;

  /// [dark] define.
  final QuiColorPalette? dark;

  const QuiTheme({
    super.key,
    this.initialThemeMode = ThemeMode.system,
    this.light,
    this.dark,
    required this.builder,
  });

  /// [of] function define.
  static QuiThemeManager of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedCustomTheme>()!
        .themeManager;
  }

  /// [getThemeMode] function define.
  /// return of [ThemeMode] from shared preferences .
  static ThemeMode getThemeMode(BuildContext context) =>
      of(context).themeMode.value;
  static ThemeData getThemeData(BuildContext context) => Theme.of(context);
  static QuiTypography typography(BuildContext context) =>
      of(context).typography;

  static bool isDark(BuildContext context) {
    final themeMode = getThemeMode(context);
    if (themeMode == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
    return themeMode == ThemeMode.dark;
  }

  @override
  State<QuiTheme> createState() => _QuiThemeState();
}

class _QuiThemeState extends State<QuiTheme> with QuiThemeManager {
  @override
  void initState() {
    initTheme(
      themeMode: widget.initialThemeMode,
      light: widget.light,
      dark: widget.dark,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeMode,
      builder: (context, value, _) {
        return InheritedCustomTheme(
          themeManager: this,
          themeMode: value,
          child: widget.builder(
            palette.light.themeData,
            palette.dark.themeData,
            value,
          ),
        );
      },
    );
  }
}

class InheritedCustomTheme extends InheritedWidget {
  final ThemeMode themeMode;
  final QuiThemeManager themeManager;

  const InheritedCustomTheme({
    required this.themeMode,
    required this.themeManager,
    super.key,
    required super.child,
  });

  @override
  bool updateShouldNotify(InheritedCustomTheme oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
