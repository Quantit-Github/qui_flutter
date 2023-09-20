import 'package:flutter/material.dart';
import 'package:qui_flutter/style/base_color/base_color.dart';

///
/// Semantic Color
///
class SemanticColor extends BaseSemanticColor {
  SemanticColor({
    Color? brightest,
    Color? borderHigh,
    Color? borderMedium,
    Color? borderLow,
    Color? stateOverlayFocused,
    Color? primaryLighten,
  }) : super(
          brightest: brightest ?? const Color(0xFFFDFDFD),
          borderHigh: borderHigh ?? const Color(0xFF101014).withOpacity(0.8),
          borderMedium:
              borderMedium ?? const Color(0xFF101014).withOpacity(0.15),
          borderLow: borderLow ?? const Color(0xFF101014).withOpacity(0.06),
          stateOverlayFocused: stateOverlayFocused ?? const Color(0xFFBAD4FF),
          primaryLighten: primaryLighten ?? const Color(0xFF2B31EC),
        );

  @override
  SemanticColor copyWith({
    Color? brightest,
    Color? borderHigh,
    Color? borderMedium,
    Color? borderLow,
    Color? stateOverlayFocused,
    Color? primaryLighten,
  }) {
    return SemanticColor(
      brightest: brightest ?? this.brightest,
      borderHigh: borderHigh ?? this.borderHigh,
      borderMedium: borderMedium ?? this.borderMedium,
      borderLow: borderLow ?? this.borderLow,
      stateOverlayFocused: stateOverlayFocused ?? this.stateOverlayFocused,
      primaryLighten: primaryLighten ?? this.primaryLighten,
    );
  }
}
