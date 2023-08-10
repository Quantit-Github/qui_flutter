// Copyright © 2020 Birju Vachhani. All rights reserved.
// Use of this source code is governed by an Apache license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:qui_flutter/core/mode.dart';
import 'package:qui_flutter/core/theme_manager.dart';

/// An inherited widget that saves provides current mode, theme, dark theme and
/// brightness to its children.
/// This is an internal widget and should not be used directly.
class InheritedQuiTheme<T extends Object> extends InheritedWidget {
  final QuiThemeMode mode;
  final T theme;
  final T darkTheme;
  final Brightness? brightness;

  InheritedQuiTheme({
    super.key,
    required QuiThemeManager<T> manager,
    required super.child,
  })  : mode = manager.mode,
        theme = manager.theme,
        darkTheme = manager.darkTheme,
        brightness = manager.brightness;

  @override
  bool updateShouldNotify(covariant InheritedQuiTheme<T> oldWidget) {
    return oldWidget.mode != mode ||
        oldWidget.theme != theme ||
        oldWidget.darkTheme != darkTheme ||
        oldWidget.brightness != brightness;
  }
}
