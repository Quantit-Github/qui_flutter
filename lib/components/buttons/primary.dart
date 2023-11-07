import 'package:flutter/material.dart';
import 'package:qui_flutter/components/buttons/base.dart';
import 'package:qui_flutter/core/qui_theme.dart';
import 'package:qui_flutter/style/color.dart';
import 'package:qui_flutter/style/tokens/button_token.dart';
import 'package:qui_flutter/style/tokens/state_overlay.dart';

class QuiButtonPrimary extends StatefulWidget {
  const QuiButtonPrimary({
    required this.onPressed,
    super.key,
    required this.title,
    this.prefix,
    this.suffix,
    this.size,
    this.alignment,
    this.backgroundColor,
    this.highlightColor,
    this.disabledColor,
    this.hoverColor,
    this.focusColor,
  });

  final Function()? onPressed;
  final String title;
  final Widget? prefix;
  final Widget? suffix;

  final ButtonSize? size;
  final ButtonAlign? alignment;
  final Color? backgroundColor;
  final Color? highlightColor;
  final Color? disabledColor;
  final Color? hoverColor;
  final Color? focusColor;

  @override
  State<QuiButtonPrimary> createState() => _QuiButtonPrimaryState();
}

class _QuiButtonPrimaryState extends State<QuiButtonPrimary>
    with ButtonPrimaryToken, ButtonStateOverlayToken {
  QuiColorPalette get color => QuiTheme.of(context).color;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      alignment: widget.alignment ?? ButtonAlign.center,
      backgroundColor: widget.backgroundColor ?? container,
      highlightColor: widget.highlightColor ?? pressed,
      disabledColor: widget.disabledColor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      onPressed: widget.onPressed,
      prefixWidget: widget.prefix,
      suffixWidget: widget.suffix,
      size: widget.size ?? ButtonSize.xl,
      title: widget.title,
    );
  }
}
