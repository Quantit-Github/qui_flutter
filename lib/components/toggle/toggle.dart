import 'package:flutter/material.dart';
import 'package:qui_flutter/core/qui_theme.dart';

///
/// QUI Toggle Button
///
class QuiToggle extends StatefulWidget {
  const QuiToggle({
    required this.flag,
    required this.onChanged,
    this.disabled,
    super.key,
    this.activeThumbColor,
    this.inactiveThumbColor,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.width,
    this.height,
    this.padding,
  });

  final bool flag;
  final bool? disabled;
  final Function(bool) onChanged;
  final Color? activeThumbColor;
  final Color? inactiveThumbColor;
  final Color? activeBackgroundColor;
  final Color? inactiveBackgroundColor;
  final double? width;
  final double? height;
  final double? padding;

  @override
  State<QuiToggle> createState() => _QuiToggleState();
}

class _QuiToggleState extends State<QuiToggle> {
  late bool flag;
  late final bool disabled;

  @override
  void initState() {
    super.initState();
    flag = widget.flag;
    _width = widget.width ?? 56;
    _height = widget.height ?? 32;
    _padding = widget.padding ?? 4;
    disabled = widget.disabled ?? false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        if (disabled) {
          final disabledColor =
              QuiTheme.of(context).colorTokens.switchTokens.switchDisabled;

          _activeThumbColor = widget.activeThumbColor ?? disabledColor.handle;
          _inactiveThumbColor =
              widget.inactiveThumbColor ?? disabledColor.handle;
          _activeBackgroundColor =
              widget.activeBackgroundColor ?? disabledColor.container;
          _inactiveBackgroundColor =
              widget.inactiveBackgroundColor ?? disabledColor.container;
        } else {
          final toggleToken = QuiTheme.of(context).colorTokens.toggleTokens;
          _activeThumbColor =
              widget.activeThumbColor ?? toggleToken.toggleOn.handle;
          _inactiveThumbColor =
              widget.inactiveThumbColor ?? toggleToken.toggleOff.handle;
          _activeBackgroundColor =
              widget.activeBackgroundColor ?? toggleToken.toggleOn.container;
          _inactiveBackgroundColor =
              widget.inactiveBackgroundColor ?? toggleToken.toggleOff.container;
        }
      });
    });
  }

  late final double _width;
  late final double _height;
  late final double _padding;
  Color _activeThumbColor = Colors.transparent;
  Color _inactiveThumbColor = Colors.transparent;
  Color _activeBackgroundColor = Colors.transparent;
  Color _inactiveBackgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled
          ? null
          : () {
              setState(() {
                flag = !flag;
              });
              widget.onChanged(flag);
            },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _width,
        height: _height,
        padding: EdgeInsets.all(_padding),
        alignment: flag ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          color: flag ? _activeBackgroundColor : _inactiveBackgroundColor,
          borderRadius: BorderRadius.circular(9999),
        ),
        child: CircleAvatar(
          radius: (_height - (_padding * 2)) / 2,
          backgroundColor: flag ? _activeThumbColor : _inactiveThumbColor,
        ),
      ),
    );
  }
}
