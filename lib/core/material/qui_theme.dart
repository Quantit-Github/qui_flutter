import 'package:flutter/material.dart';
import 'package:qui_flutter/core/inherited_qui_theme.dart';
import 'package:qui_flutter/core/mode.dart';
import 'package:qui_flutter/core/theme_manager.dart';
import 'package:qui_flutter/core/theme_preferences.dart';
import 'package:qui_flutter/style/theme.dart';

// typedef QuiThemeBuilder = Widget Function(ThemeData light, ThemeData dark);
typedef QuiThemeBuilder = Widget Function(
  ThemeData theme,
  ThemeData light,
  ThemeData dark,
);

class QuiMaterialTheme extends StatefulWidget {
  const QuiMaterialTheme({
    this.dark,
    this.light,
    required this.builder,
    required this.initial,
    super.key,
  });

  /// Represents the light theme for the app.
  final ThemeData? light;

  /// Represents the dark theme for the app. (Optional)
  final ThemeData? dark;

  /// Provides a builder with access of light and dark theme. Intended to
  /// be used to return [MaterialApp].
  final QuiThemeBuilder builder;

  /// Indicates which [QuiThemeMode] to use initially.
  final QuiThemeMode initial;

  @override
  State<QuiMaterialTheme> createState() => _QuiMaterialThemeState();

  /// [of] function define.
  static QuiThemeManager<ThemeData> of(BuildContext context) {
    context.dependOnInheritedWidgetOfExactType<InheritedQuiTheme<ThemeData>>()!;
    return context.findAncestorStateOfType<State<QuiMaterialTheme>>()!
        as QuiThemeManager<ThemeData>;
  }

  /// [getThemeMode] function define.
  /// return of [QuiThemeMode] from shared preferences .
  static Future<QuiThemeMode?> getThemeMode() async {
    return (await ThemePreferences.fromPrefs())?.mode;
  }
}

class _QuiMaterialThemeState extends State<QuiMaterialTheme>
    with WidgetsBindingObserver, QuiThemeManager<ThemeData> {
  @override
  void initState() {
    super.initState();
    initializeTheme(
      light: widget.light ?? QuiTheme.light,
      dark: widget.dark ?? QuiTheme.dark,
      initial: widget.initial,
    );
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    if (mode.isSystem && mounted) setState(() {});
  }

  @override
  void dispose() {
    modeChangeNotifier.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child = widget.builder(
      theme,
      lightTheme,
      darkTheme,
    );

    // 상태관리 패키지로 대체 가능함.
    return InheritedQuiTheme(
      manager: this,
      child: child,
    );
  }

  @override
  Brightness get brightness => theme.brightness;

  @override
  Future<bool> reset() async {
    setTheme(
      light: widget.light ?? QuiTheme.light,
      dark: widget.dark ?? QuiTheme.dark,
      notify: false,
    );
    return super.reset();
  }

  @override
  bool get isDefault =>
      lightTheme == widget.light &&
      darkTheme == widget.dark &&
      mode == defaultMode;

  @override
  void updateState() {
    if (mounted) setState(() {});
  }
}
