import 'package:flutter/material.dart';

///
/// QUI Toggle Button
///
class QuiToggle extends StatefulWidget {
  const QuiToggle({
    required this.flag,
    required this.onChanged,
    this.disabled,
    super.key,
    this.thumbColor,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.width,
    this.height,
    this.padding,
  });

  final bool flag;
  final bool? disabled;
  final Function(bool) onChanged;
  final Color? thumbColor;
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
    flag = widget.flag;
    _width = widget.width ?? 56;
    _height = widget.height ?? 32;
    _padding = widget.padding ?? 4;
    disabled = widget.disabled ?? false;
    super.initState();
  }

  late final double _width;
  late final double _height;
  late final double _padding;

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
          color: flag ? Colors.amber : Colors.black,
          borderRadius: BorderRadius.circular(9999),
        ),
        child: CircleAvatar(
          radius: (_height - (_padding * 2)) / 2,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
