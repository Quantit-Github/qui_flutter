import 'package:qui_flutter/style/color_palette.dart';
import 'package:qui_flutter/style/color_tokens/switch/switch_disabled.dart';

///
/// Switch Color Tokens
///
class SwitchTokens {
  final QuiColorPalette _cp;

  SwitchDisabled get switchDisabled => SwitchDisabled(colorPallete: _cp);

  SwitchTokens({
    required QuiColorPalette cp,
  }) : _cp = cp;
}
