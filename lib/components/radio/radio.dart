import 'package:flutter/material.dart';
import 'package:qui_flutter/core/qui_theme.dart';

class QuiRadioButton<T> extends StatefulWidget {
  const QuiRadioButton(
      {super.key,
      this.disabled,
      required this.value,
      required this.groupValue,
      required this.label,
      required this.text,
      required this.onChanged});

  final bool? disabled;
  final T value;
  final T? groupValue;
  final String label;
  final String text;
  final ValueChanged<T?> onChanged;

  @override
  _QuiRadioButtonState<T> createState() => _QuiRadioButtonState<T>();
}

class _QuiRadioButtonState<T> extends State<QuiRadioButton<T>> {
  late final bool disabled;

  @override
  void initState() {
    super.initState();
    disabled = widget.disabled ?? false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        if (disabled) {
          final disabledColor =
              QuiTheme.of(context).colorTokens.switchTokens.switchDisabled;

          // _fillColor = disabledColor.icon;
          // _radioBackColor = disabledColor
          // _textColor = disabledColor.label;
        } else {
          final radioToken =
              QuiTheme.of(context).colorTokens.switchTokens.switchDisabled;
          // _fillColor
          // _radioBackColor
          // _textColor =
        }
      });
    });
  }

  Color _fillColor = Colors.transparent;
  Color _radioBackColor = Colors.transparent;
  Color _textColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    // FIXME: 색상고쳐야 함
    // Color _pressColor = QuiTheme.of(context).colorTokens.stateOverlay.pressed; <- 색상 변화가 없음
    Color _pressColor = Colors.blue;

    return MaterialButton(
      onPressed: () => widget.onChanged(widget.value),
      highlightColor: _pressColor,
      child: Container(
        width: fitcontent,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.transparent),
        child: Row(
          children: [
            Radio<T>(
              value: widget.value,
              groupValue: widget.groupValue,
              onChanged: widget.onChanged,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              fillColor: MaterialStateProperty.all(Colors.black45),
            ),
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: QuiTheme.of(context).colorPalette!.blackColor.s100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
