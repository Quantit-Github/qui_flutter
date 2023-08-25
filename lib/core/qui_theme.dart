import 'package:flutter/material.dart';
import 'package:qui_flutter/core/theme_manager.dart';
import 'package:qui_flutter/core/theme_preferences.dart';
import 'package:qui_flutter/style/color_pallete.dart';
import 'package:qui_flutter/style/theme.dart';

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
  final ThemeMode initThemeMode;

  /// [builder] function define.
  final ThemeBuilder builder;

  /// [lightTheme] define.
  final ThemeData? lightTheme;

  /// [darkTheme] define.
  final ThemeData? darkTheme;

  final QuiColorPallete? colorPalette;

  const QuiTheme({
    this.initThemeMode = ThemeMode.system,
    required this.builder,
    this.darkTheme,
    this.lightTheme,
    this.colorPalette,
    super.key,
  });

  /// [of] function define.
  static QuiThemeManager of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedCustomTheme>()!
        .themeManager;
  }

  /// [getThemeMode] function define.
  /// return of [ThemeMode] from shared preferences .
  static Future<ThemeMode> getThemeMode() async {
    return await QuiThemePreferences().getThemeMode();
  }

  @override
  State<QuiTheme> createState() => _QuiThemeState();
}

class _QuiThemeState extends State<QuiTheme> with QuiThemeManager {
  @override
  void initState() {
    initTheme(
      themeMode: widget.initThemeMode,
      colorPalette: widget.colorPalette,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeMode,
        builder: (context, value, _) {
          final theme = QuiColorTheme(colorPalette: colorPalette);
          return InheritedCustomTheme(
            themeManager: this,
            themeMode: value,
            child: widget.builder(
              theme.light,
              theme.dark,
              value,
            ),
          );
        });
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
