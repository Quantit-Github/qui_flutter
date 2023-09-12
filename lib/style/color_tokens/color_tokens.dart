import 'package:qui_flutter/style/color_pallete.dart';
import 'package:qui_flutter/style/color_tokens/button/button_token.dart';
import 'package:qui_flutter/style/color_tokens/state_overlay.dart';

class QuiColorTokens {
  final QuiColorPallete _cp;

  StateOverlay get stateOverlay => StateOverlay.dark(_cp);

  ButtonTokens get buttonTokens => ButtonTokens(
        cp: _cp,
      );

  QuiColorTokens({
    required QuiColorPallete cp,
  }) : _cp = cp;
}
