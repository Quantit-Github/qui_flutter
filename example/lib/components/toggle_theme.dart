import 'package:flutter/material.dart';
import 'package:qui_flutter/qui_flutter.dart';

class ToggleTheme extends StatelessWidget {
  const ToggleTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final QuiColorPalette color = QuiTheme.of(context).color;
    return FloatingActionButton(
      onPressed: () => QuiTheme.of(context).toggleThemeMode(),
      backgroundColor: color.primary.s90,
      child: Builder(builder: (context) {
        final themeMode = QuiTheme.of(context).themeMode;
        if (themeMode.value == ThemeMode.light) {
          return const Icon(Icons.light_mode);
        } else if (themeMode.value == ThemeMode.dark) {
          return const Icon(Icons.dark_mode);
        } else {
          return const Icon(Icons.settings_brightness);
        }
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
