import 'package:qui_flutter/style/color_pallete.dart';
import 'package:qui_flutter/style/color_tokens/button/button_token.dart';
import 'package:qui_flutter/style/color_tokens/state_overlay.dart';

class QuiColorTokens {
  final QuiColorPallete _cp;
  final bool _isDark;

  StateOverlay get stateOverlay =>
      _isDark ? StateOverlay.dark(_cp) : StateOverlay.light(_cp);

  ButtonTokens get buttonTokens => ButtonTokens(
        isDark: _isDark,
        cp: _cp,
      );

  QuiColorTokens({
    required bool isDark,
    required QuiColorPallete cp,
  })  : _isDark = isDark,
        _cp = cp;
}
