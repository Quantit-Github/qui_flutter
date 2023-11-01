import 'package:flutter/material.dart';
import 'package:qui_flutter/qui_flutter.dart';

mixin CheckBoxStyle {
  late BuildContext _context;

  void initStyle({required BuildContext context}) {
    _context = context;
  }

  QuiThemeManager get themeManager => QuiTheme.of(_context);
  bool get isDark => QuiTheme.isDark(_context);
}
