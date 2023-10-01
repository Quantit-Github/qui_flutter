import 'package:qui_flutter/style/color_palette.dart';
import 'package:qui_flutter/style/color_tokens/switch/toggle/toggle_off.dart';
import 'package:qui_flutter/style/color_tokens/switch/toggle/toggle_on.dart';

///
/// Toggle Color Tokens
///
class ToggleTokens {
  final QuiColorPalette _cp;

  ToggleOn get toggleOn => ToggleOn(colorPallete: _cp);

  ToggleOff get toggleOff => ToggleOff(colorPallete: _cp);

  ToggleTokens({
    required QuiColorPalette cp,
  }) : _cp = cp;
}
