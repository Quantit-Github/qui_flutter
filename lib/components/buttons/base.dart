import 'package:flutter/material.dart';
import 'package:qui_flutter/core/qui_theme.dart';
import 'package:qui_flutter/style/color.dart';
import 'package:qui_flutter/style/tokens/button_token.dart';
import 'package:qui_flutter/style/tokens/state_overlay.dart';
import 'package:qui_flutter/style/typography.dart';

///
/// Base Button
///
class BaseButton extends StatefulWidget {
  const BaseButton({
    this.alignment = ButtonAlign.center,
    this.size = ButtonSize.xl,
    required this.backgroundColor,
    required this.highlightColor,
    required this.title,
    this.hoverColor,
    this.focusColor,
    this.disabledColor,
    this.prefixWidget,
    this.suffixWidget,
    this.onPressed,
    this.textStyle,
    super.key,
  });

  final ButtonSize size;
  final ButtonAlign alignment;
  final Color backgroundColor;
  final Color highlightColor;
  final Color? disabledColor;
  final Color? hoverColor;
  final Color? focusColor;

  final Function()? onPressed;

  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextStyle? textStyle;
  final String title;

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton>
    with TickerProviderStateMixin, ButtonCommonToken, ButtonStateOverlayToken {
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  late AnimationController _controller2;
  late Animation<Offset> _offsetAnimation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -2),
      end: const Offset(0.0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _offsetAnimation2 = Tween<Offset>(
      begin: const Offset(0.0, 0),
      end: const Offset(0.0, 2),
    ).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    QuiTheme.of(context).color.grayScale.s100;
    return Container(
      margin: const EdgeInsets.all(20),
      child: ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (context, value, _) {
            return ClipRRect(
              child: MaterialButton(
                key: widget.key,
                onPressed: widget.onPressed == null
                    ? null
                    : () async {
                        isLoading.value = true;
                        _controller.forward();
                        _controller2.forward();

                        await Future.delayed(const Duration(seconds: 2));
                        // await widget.onPressed;
                        isLoading.value = false;
                        _controller.reverse();
                        _controller2.reverse();
                      },
                color: value
                    ? Color.alphaBlend(loadingContainer, widget.backgroundColor)
                    : widget.backgroundColor,
                highlightColor: widget.highlightColor,
                disabledColor: widget.disabledColor ?? disabledContainer,
                hoverColor: widget.hoverColor ?? hover,
                focusColor: widget.focusColor ?? focused,
                padding: widget.size.padding,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(widget.size.radius),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SlideTransition(
                      position: _offsetAnimation2,
                      child: Row(
                        mainAxisSize: widget.size.mainAxisSize,
                        mainAxisAlignment: widget.alignment.axis,
                        children: [
                          if (widget.prefixWidget != null) widget.prefixWidget!,
                          Text(
                            widget.title,
                            style: QuiTheme.of(context)
                                .typography
                                .bodyLarge
                                .bold
                                .copyWith(
                                  color: widget.onPressed == null
                                      ? disabledElement
                                      : Colors.white,
                                ),
                          ),
                          if (widget.suffixWidget != null) widget.suffixWidget!,
                        ],
                      ),
                    ),
                    SlideTransition(
                      position: _offsetAnimation,
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: QuiTheme.of(context).color.whiteColor.s0,
                          backgroundColor:
                              QuiTheme.of(context).color.grayScale.s50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  QuiColorPalette get color => QuiTheme.of(context).color;
}

///
/// Button Size enum
///
enum ButtonSize {
  xl(EdgeInsets.all(16), MainAxisSize.max, 12),
  lg(EdgeInsets.symmetric(horizontal: 16, vertical: 12), MainAxisSize.max, 12),
  md(EdgeInsets.all(8), MainAxisSize.min, 8),
  sm(EdgeInsets.symmetric(horizontal: 8, vertical: 6), MainAxisSize.min, 8);

  const ButtonSize(this.padding, this.mainAxisSize, this.radius);

  final EdgeInsets padding;
  final MainAxisSize mainAxisSize;
  final double radius;
}

///
/// Button Alignment enum
///
enum ButtonAlign {
  hug(MainAxisAlignment.center),
  left(MainAxisAlignment.start),
  right(MainAxisAlignment.end),
  center(MainAxisAlignment.spaceBetween);

  const ButtonAlign(this.axis);

  final MainAxisAlignment axis;
}

// ///
// /// Button Widget
// ///
// ///
// class QuiButton extends BaseButton {
//   QuiButton({
//     super.key,
//     required super.backgroundColor,
//     required super.highlightColor,
//     required super.disabledColor,
//     required super.hoverColor,
//     required super.focusColor,
//     required super.title,
//     super.onPressed,
//     super.prefixWidget,
//     super.suffixWidget,
//     super.alignment,
//     super.size,
//     super.textStyle,
//   });

//   factory QuiButton.primary({
//     required BuildContext context,
//     required String title,
//     Color? backgroundColor,
//     Color? highlightColor,
//     Color? disabledColor,
//     Color? hoverColor,
//     Color? focusColor,
//     Widget? prefixWidget,
//     Widget? suffixWidget,
//     ButtonAlign alignment = ButtonAlign.center,
//     ButtonSize size = ButtonSize.xl,
//     TextStyle? textStyle,
//     Function()? onPressed,
//   }) {
//     return QuiButton(
//       onPressed: onPressed,
//       backgroundColor: backgroundColor ?? ButtonPrimaryToken(context).container,
//       highlightColor: highlightColor ?? StateOverlayToken(context).pressed,
//       hoverColor: hoverColor ?? StateOverlayToken(context).hover,
//       focusColor: focusColor ?? StateOverlayToken(context).focused,
//       disabledColor:
//           disabledColor ?? ButtonCommonDisabledToken(context).container,
//       alignment: alignment,
//       size: size,
//       prefixWidget: prefixWidget,
//       suffixWidget: suffixWidget,
//       title: title,
//       textStyle: textStyle ??
//           QuiTheme.of(context).typography.bodyLarge.bold.copyWith(
//               color: onPressed == null
//                   ? ButtonCommonDisabledToken(context).element
//                   : ButtonPrimaryToken(context).elements),
//     );
//   }

//   factory QuiButton.secondary({
//     required BuildContext context,
//     required String title,
//     Color? backgroundColor,
//     Color? highlightColor,
//     Color? disabledColor,
//     Color? hoverColor,
//     Color? focusColor,
//     Widget? prefixWidget,
//     Widget? suffixWidget,
//     ButtonAlign alignment = ButtonAlign.center,
//     ButtonSize size = ButtonSize.xl,
//     TextStyle? textStyle,
//     Function()? onPressed,
//   }) {
//     return QuiButton(
//       onPressed: onPressed,
//       backgroundColor:
//           backgroundColor ?? ButtonSecondaryToken(context).container,
//       highlightColor: highlightColor ?? StateOverlayToken(context).pressed,
//       hoverColor: hoverColor ?? StateOverlayToken(context).hover,
//       focusColor: focusColor ?? StateOverlayToken(context).focused,
//       disabledColor:
//           disabledColor ?? ButtonCommonDisabledToken(context).container,
//       alignment: alignment,
//       size: size,
//       prefixWidget: prefixWidget,
//       suffixWidget: suffixWidget,
//       title: title,
//       textStyle: textStyle ??
//           QuiTheme.of(context).typography.bodyLarge.bold.copyWith(
//               color: onPressed == null
//                   ? ButtonCommonDisabledToken(context).element
//                   : ButtonSecondaryToken(context).elements),
//     );
//   }

//   factory QuiButton.ghost({
//     required BuildContext context,
//     required String title,
//     Color? backgroundColor,
//     Color? highlightColor,
//     Color? disabledColor,
//     Color? hoverColor,
//     Color? focusColor,
//     Widget? prefixWidget,
//     Widget? suffixWidget,
//     ButtonAlign alignment = ButtonAlign.center,
//     ButtonSize size = ButtonSize.xl,
//     TextStyle? textStyle,
//     Function()? onPressed,
//   }) {
//     return QuiButton(
//       onPressed: onPressed,
//       backgroundColor: backgroundColor ?? ButtonGhostToken(context).container,
//       highlightColor: highlightColor ?? StateOverlayToken(context).pressed,
//       hoverColor: hoverColor ?? StateOverlayToken(context).hover,
//       focusColor: focusColor ?? StateOverlayToken(context).focused,
//       disabledColor:
//           disabledColor ?? ButtonCommonDisabledToken(context).container,
//       alignment: alignment,
//       size: size,
//       prefixWidget: prefixWidget,
//       suffixWidget: suffixWidget,
//       title: title,
//       textStyle: textStyle ??
//           QuiTheme.of(context).typography.bodyLarge.bold.copyWith(
//               color: onPressed == null
//                   ? ButtonCommonDisabledToken(context).element
//                   : ButtonGhostToken(context).elements),
//     );
//   }
// }
