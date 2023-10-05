import 'package:qui_flutter/style/color_pallete.dart';
import 'package:qui_flutter/style/color_tokens/switch/radio/radio_default.dart';
import 'package:qui_flutter/style/color_tokens/switch/radio/radio_selected.dart';

///
/// Radio Color Tokens
///
class RadioTokens {
  final QuiColorPallete _cp;

  RadioSelected get radioSelected => RadioSelected(colorPallete: _cp);

  RadioDefault get radioDefault => RadioDefault(colorPallete: _cp);

  RadioTokens({
    required QuiColorPallete cp,
  }) : _cp = cp;
}
