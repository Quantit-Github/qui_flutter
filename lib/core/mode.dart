///
/// after Dart 2.17 can using this enum system
///
enum QuiThemeMode {
  light('Light'),
  dark('Dark'),
  system('System');

  const QuiThemeMode(this.modeName);

  final String modeName;

  bool get isLight => this == QuiThemeMode.light;

  bool get isDark => this == QuiThemeMode.dark;

  bool get isSystem => this == QuiThemeMode.system;
}
