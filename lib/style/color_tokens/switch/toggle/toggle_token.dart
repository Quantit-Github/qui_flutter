import 'package:qui_flutter/style/color_pallete.dart';
import 'package:qui_flutter/style/color_tokens/switch/toggle/toggle_off.dart';
import 'package:qui_flutter/style/color_tokens/switch/toggle/toggle_on.dart';

///
/// Toggle Color Tokens
///
class ToggleTokens {
  final QuiColorPallete _cp;

  ToggleOn get toggleOn => ToggleOn(colorPallete: _cp);

  ToggleOff get toggleOff => ToggleOff(colorPallete: _cp);

  ToggleTokens({
    required QuiColorPallete cp,
  }) : _cp = cp;
}
