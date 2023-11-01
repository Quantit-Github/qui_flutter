// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:qui_flutter/style/color.dart';

/// Light Color Palette
final QUI_LIGHT_PRIMARY = ColorRange(
  s0: const Color(0xFF040518),
  s10: const Color(0xFF090A2F),
  s20: const Color(0xFF0D0F47),
  s30: const Color(0xFF11145E),
  s40: const Color(0xFF1A1D8E),
  s50: const Color(0xFF2227BD),
  s60: const Color(0xFF2B31EC),
  s70: const Color(0xFF3355FF),
  s80: const Color(0xFF5B8FFF),
  s90: const Color(0xFF8AB5FF),
  s95: const Color(0xFFBAD4FF),
  s99: const Color(0xFFD8E2FA),
  s100: const Color(0xFFF2F6FA),
);

final QUI_LIGHT_GRAY_SCALE = ColorRange(
  s0: const Color(0xFF1B1D20),
  s10: const Color(0xFF3D3F45),
  s20: const Color(0xFF525559),
  s30: const Color(0xFF686A6E),
  s40: const Color(0xFF7D7F83),
  s50: const Color(0xFF939597),
  s60: const Color(0xFFA9AAAC),
  s70: const Color(0xFFBEBFC1),
  s80: const Color(0xFFD4D4D6),
  s90: const Color(0xFFE9EAEA),
  s95: const Color(0xFFF4F4F5),
  s99: const Color(0xFFF9F9F9),
  s100: const Color(0xFFFDFDFD),
);

final QUI_LIGHT_BLACK_COLOR = ColorRange.withOpacity(
  color: const Color(0xFF101014),
);

final QUI_LIGHT_WHITE_COLOR = ColorRange.withOpacity(
  color: const Color(0xFFF3F6FD),
);

final QUI_LIGHT_SEMANTIC_COLOR = SemanticColor(
  brightest: const Color(0xFFFDFDFD),
  borderHigh: const Color(0xFF101014).withOpacity(0.8),
  borderMedium: const Color(0xFF101014).withOpacity(0.15),
  borderLow: const Color(0xFF101014).withOpacity(0.06),
  stateOverlayFocused: const Color(0xFFBAD4FF),
  primaryLighten: const Color(0xFF2B31EC),
);

/// Dark Color Palette
final QUI_DARK_PRIMARY = ColorRange(
  s0: const Color(0xFFF2F6FA),
  s10: const Color(0xFFD8E2FA),
  s20: const Color(0xFFBAD4FF),
  s30: const Color(0xFF8AB5FF),
  s40: const Color(0xFF5B8FFF),
  s50: const Color(0xFF3355FF),
  s60: const Color(0xFF2B31EC),
  s70: const Color(0xFF2227BD),
  s80: const Color(0xFF1A1D8E),
  s90: const Color(0xFF11145E),
  s95: const Color(0xFF0D0F47),
  s99: const Color(0xFF090A2F),
  s100: const Color(0xFF040518),
);

final QUI_DARK_GRAY_SCALE = ColorRange(
  s0: const Color(0xFFFDFDFD),
  s10: const Color(0xFFF9F9F9),
  s20: const Color(0xFFF4F4F5),
  s30: const Color(0xFFE9EAEA),
  s40: const Color(0xFFD4D4D6),
  s50: const Color(0xFFBEBFC1),
  s60: const Color(0xFFA9AAAC),
  s70: const Color(0xFF939597),
  s80: const Color(0xFF7D7F83),
  s90: const Color(0xFF686A6E),
  s95: const Color(0xFF525559),
  s99: const Color(0xFF3D3F45),
  s100: const Color(0xFF1B1D20),
);

final QUI_DARK_BLACK_COLOR = ColorRange.withOpacity(
  color: const Color(0xFFF3F6FD),
);

final QUI_DARK_WHITE_COLOR = ColorRange.withOpacity(
  color: const Color(0xFF101014),
);

final QUI_DARK_SEMANTIC_COLOR = SemanticColor(
  brightest: const Color(0xFFFDFDFD),
  borderHigh: const Color(0xFFF9FAFD).withOpacity(0.8),
  borderMedium: const Color(0xFFF9FAFD).withOpacity(0.15),
  borderLow: const Color(0xFFF9FAFD).withOpacity(0.06),
  stateOverlayFocused: const Color(0xFFBAD4FF),
  primaryLighten: const Color(0xFF8AB5FF),
);

final QUI_LIGHT_PALETTE = QuiColorPalette(
  primary: QUI_LIGHT_PRIMARY,
  grayScale: QUI_LIGHT_GRAY_SCALE,
  blackColor: QUI_LIGHT_BLACK_COLOR,
  whiteColor: QUI_LIGHT_WHITE_COLOR,
  semanticColor: QUI_LIGHT_SEMANTIC_COLOR,
);

final QUI_DARK_PALETTE = QuiColorPalette(
  primary: QUI_DARK_PRIMARY,
  grayScale: QUI_DARK_GRAY_SCALE,
  blackColor: QUI_DARK_BLACK_COLOR,
  whiteColor: QUI_DARK_WHITE_COLOR,
  semanticColor: QUI_DARK_SEMANTIC_COLOR,
);
