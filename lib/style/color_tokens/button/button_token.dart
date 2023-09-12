import 'package:qui_flutter/style/color_pallete.dart';
import 'package:qui_flutter/style/color_tokens/button/button_disabled.dart';
import 'package:qui_flutter/style/color_tokens/button/button_token_active.dart';

///
/// Button Colors Area
///
class ButtonTokens {
  final QuiColorPallete _cp;

  ButtonActivePrimary get activePrimary => ButtonActivePrimary.light(_cp);

  ButtonActiveSecondary get activeSecondary => ButtonActiveSecondary.light(_cp);

  ButtonActiveGhost get activeGhost => ButtonActiveGhost.light(_cp);

  ButtonActiveDisabled get activeDisabled => ButtonActiveDisabled.light(_cp);

  ButtonTokens({
    required QuiColorPallete cp,
  }) : _cp = cp;
}
