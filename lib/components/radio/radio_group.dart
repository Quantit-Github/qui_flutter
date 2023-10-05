import 'package:flutter/material.dart';
import 'package:qui_flutter/components/radio/radio_style.dart';
import 'package:qui_flutter/core/qui_theme.dart';

class QuiRadioButtonTest<T> extends StatefulWidget {
  QuiRadioButtonTest({
    super.key,
    required this.buttonLables,
    required this.buttonValues,
    this.buttonTextStyle = const ButtonTextStyle(),
    required this.radioButtonValue,
    required this.unSelectedColor,
    this.unSelectedBorderColor,
    this.padding = 4,
    this.spacing = 0,
    required this.selectedColor,
    this.selectedBorderColor,
    this.height = 32,
    this.width = 100,
    this.direction = Axis.vertical,
    this.enableShape = false,
    this.elevation = 10,
    this.shapeRadius = 50,
    this.defaultSelected,
    this.customShape,
    this.scrollController,
    this.margin,
    this.disabledValues = const [],
    this.disabledColor,
    this.overlayColor = Colors.transparent,
  })  : assert(buttonLables.length == buttonValues.length,
            "Button의 label과 value의 갯수가 일치해야합니다."),
        // assert(
        //     buttonValues.toSet().intersection(disabledValues.toSet()) ==
        //         disabledValues.toSet(),
        //     "Disabled values should be present in button values"),
        assert(buttonValues.toSet().length == buttonValues.length,
            "같은 값을 가진 버튼이 존재합니다.");

  final Axis direction;

  final ScrollController? scrollController;

  ///Values of button
  final List<T> buttonValues;

  ///Margins around card
  final EdgeInsetsGeometry? margin;

  ///Default value is 35
  final double height;
  late final double padding;

  ///Spacing between buttons
  late final double spacing;

  ///Default selected value
  final T? defaultSelected;

  ///Use this if you want to keep width of all the buttons same
  final double width;

  final List<String> buttonLables;

  ///List of disabled values
  final List<T> disabledValues;

  ///Styling class for label
  final ButtonTextStyle buttonTextStyle;

  final void Function(T) radioButtonValue;

  ///Unselected Color of the button
  final Color unSelectedColor;

  ///Selected Color of button
  final Color selectedColor;

  ///Disabled Color of button
  ///If not provided will use [unSelectedColor]
  final Color? disabledColor;
  final Color? overlayColor;

  ///Unselected Color of the button border
  final Color? unSelectedBorderColor;

  ///Selected Color of button border
  final Color? selectedBorderColor;

  /// A custom Shape can be applied (will work only if [enableShape] is true)
  final ShapeBorder? customShape;

  ///if true button will have rounded corners
  ///If you want custom shape you can use [customShape] property
  final bool enableShape;
  final double elevation;

  /// Radius for shape radio button
  final double shapeRadius;

  @override
  QuiRadioButtonState<T> createState() => QuiRadioButtonState<T>();
}

class QuiRadioButtonState<T> extends State<QuiRadioButton<T>> {
  T? _currentSelectedValue;

  Color _borderColor(T e) =>
      (_currentSelectedValue == e
          ? widget.selectedBorderColor
          : widget.unSelectedBorderColor) ??
      Theme.of(context).primaryColor;

  @override
  void initState() {
    super.initState();
    if (widget.defaultSelected != null) {
      if (widget.buttonValues.contains(widget.defaultSelected)) {
        _currentSelectedValue = widget.defaultSelected;
      } else
        throw Exception("Default Value not found in button value list");
    }
  }

  List<T> get buttonValues => widget.buttonValues;

  List<String> get buttonLables => widget.buttonLables;

  List<T> get disabledValues => widget.disabledValues;

  /// This function will select the button and update the state
  /// THis can be access from outside to change the selected value programatically
  /// Please note that this will all call the [radioButtonValue] callback
  void selectButton(T selectedValue) {
    widget.radioButtonValue(selectedValue);
    if (mounted) setState(() {});
    _currentSelectedValue = selectedValue;
  }

  List<Widget> _buildButtonsColumn() {
    return buttonValues.map((e) {
      int index = buttonValues.indexOf(e);
      bool disabled = disabledValues.contains(e);
      return Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Card(
          margin: widget.margin ?? const EdgeInsets.all(4),
          color: disabled
              ? widget.disabledColor ?? widget.unSelectedColor
              : _currentSelectedValue == e
                  ? widget.selectedColor
                  : widget.unSelectedColor,
          elevation: widget.elevation,
          shape: widget.enableShape
              ? widget.customShape ??
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.shapeRadius)),
                  )
              : null,
          child: Container(
            height: widget.height,
            child: MaterialButton(
              shape: widget.enableShape
                  ? widget.customShape ??
                      OutlineInputBorder(
                        borderSide:
                            BorderSide(color: _borderColor(e), width: 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.shapeRadius)),
                      )
                  : OutlineInputBorder(
                      borderSide: BorderSide(color: _borderColor(e), width: 1),
                      borderRadius: BorderRadius.zero,
                    ),
              onPressed: disabled ? null : () => selectButton(e),
              child: Wrap(
                children: [
                  Radio(
                    value: widget.buttonValues[index],
                    groupValue: _currentSelectedValue,
                    overlayColor:
                        MaterialStateProperty.all(widget.overlayColor),
                    onChanged: (value) {},
                  ),
                  Text(
                    widget.buttonLables[index],
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: widget.buttonTextStyle.textStyle.copyWith(
                      color: disabled
                          ? widget.buttonTextStyle.disabledColor
                          : _currentSelectedValue == e
                              ? widget.buttonTextStyle.selectedColor
                              : widget.buttonTextStyle.unSelectedColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildButtonsRow() {
    return buttonValues.map((e) {
      int index = buttonValues.indexOf(e);
      bool disabled = disabledValues.contains(e);
      return Card(
        margin: widget.margin ?? const EdgeInsets.all(4),
        color: disabled
            ? widget.disabledColor ?? widget.unSelectedColor
            : _currentSelectedValue == e
                ? widget.selectedColor
                : widget.unSelectedColor,
        elevation: widget.elevation,
        shape: widget.enableShape
            ? widget.customShape ??
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.shapeRadius)),
                )
            : null,
        child: Container(
          height: widget.height,
          width: widget.width,
          constraints: const BoxConstraints(maxWidth: 250),
          child: MaterialButton(
              shape: widget.enableShape
                  ? widget.customShape ??
                      OutlineInputBorder(
                        borderSide:
                            BorderSide(color: _borderColor(e), width: 1),
                        borderRadius: BorderRadius.all(
                            Radius.circular(widget.shapeRadius)),
                      )
                  : OutlineInputBorder(
                      borderSide: BorderSide(color: _borderColor(e), width: 1),
                      borderRadius: BorderRadius.zero,
                    ),
              onPressed: disabled ? null : () => selectButton(e),
              child: Wrap(
                children: [
                  Radio(
                    value: widget.buttonValues[index],
                    groupValue: _currentSelectedValue,
                    overlayColor: widget.overlayColor != null
                        ? MaterialStateProperty.all(widget.overlayColor)
                        : null,
                    onChanged: (value) {},
                  ),
                  Text(
                    widget.buttonLables[index],
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: widget.buttonTextStyle.textStyle.copyWith(
                      color: disabled
                          ? widget.buttonTextStyle.disabledColor
                          : _currentSelectedValue == e
                              ? widget.buttonTextStyle.selectedColor
                              : widget.buttonTextStyle.unSelectedColor,
                    ),
                  ),
                ],
              )),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return _buildRadioButtons();
  }

  _buildRadioButtons() {
    if (widget.direction == Axis.vertical) {
      return SizedBox(
        height: widget.height * (widget.buttonLables.length * 1.5) +
            widget.padding * 2 * widget.buttonLables.length,
        child: Center(
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                controller: widget.scrollController,
                children: _buildButtonsColumn()
                    .map((c) => Container(
                          padding: EdgeInsets.all(widget.spacing),
                          child: c,
                        ))
                    .toList())),
      );
    }
    if (widget.direction == Axis.horizontal) {
      return Center(
        child: Wrap(
          spacing: widget.spacing,
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          children: _buildButtonsRow(),
        ),
      );
    }
  }
}
