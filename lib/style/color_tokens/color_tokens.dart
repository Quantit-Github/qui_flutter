import 'package:qui_flutter/style/color_palette.dart';
import 'package:qui_flutter/style/color_tokens/button/button_token.dart';
import 'package:qui_flutter/style/color_tokens/divider_tokens.dart';
import 'package:qui_flutter/style/color_tokens/state_overlay.dart';
import 'package:qui_flutter/style/color_tokens/switch/switch_tokens.dart';
import 'package:qui_flutter/style/color_tokens/switch/toggle/toggle_token.dart';

class QuiColorTokens {
  final QuiColorPalette _cp;
  final bool _isDark;

  StateOverlay get stateOverlay =>
      _isDark ? StateOverlay.dark(_cp) : StateOverlay.light(_cp);

  ButtonTokens get buttonTokens => ButtonTokens(
        isDark: _isDark,
        cp: _cp,
      );

  ToggleTokens get toggleTokens => ToggleTokens(
        cp: _cp,
      );

  SwitchTokens get switchTokens => SwitchTokens(
        cp: _cp,
      );

  DividerTokens get dividerTokens => DividerTokens(
        cp: _cp,
      );

  QuiColorTokens({
    required bool isDark,
    required QuiColorPalette cp,
  })  : _isDark = isDark,
        _cp = cp;
}
