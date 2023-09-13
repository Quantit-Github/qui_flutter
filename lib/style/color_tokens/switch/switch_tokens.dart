import 'package:qui_flutter/style/color_pallete.dart';
import 'package:qui_flutter/style/color_tokens/switch/switch_disabled.dart';

///
/// Switch Color Tokens
///
class SwitchTokens {
  final QuiColorPallete _cp;

  SwitchDisabled get switchDisabled => SwitchDisabled(colorPallete: _cp);

  SwitchTokens({
    required QuiColorPallete cp,
  }) : _cp = cp;
}
