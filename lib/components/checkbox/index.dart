import 'package:flutter/material.dart';
import 'package:qui_flutter/components/checkbox/icons.dart';
import 'package:qui_flutter/qui_flutter.dart';

class CheckBox extends StatefulWidget {
  final bool initial;
  final bool isDisabled;
  final bool? useIndeterminateState;
  final void Function(bool) onChange;
  final String? label;

  const CheckBox({
    super.key,
    required this.isDisabled,
    required this.useIndeterminateState,
    required this.initial,
    required this.onChange,
    required this.label,
  });

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> with CheckBoxStyle {
  ValueNotifier<bool> isChecked = ValueNotifier<bool>(true);
  bool get useIndeterminateState => widget.useIndeterminateState ?? false;

  @override
  void initState() {
    initStyle(context: context);
    super.initState();
  }

  QuiColorPalette get color => themeManager.color;

  @override
  Widget build(BuildContext context) {
    if (widget.isDisabled) {
      return MaterialButton(
        onPressed: null,
        child: Row(
          children: [
            CheckBoxFrame.disabled(color),
            if (widget.label != null) Text(widget.label!),
          ],
        ),
      );
    }
    return MaterialButton(
      onPressed: () {
        isChecked.value = !isChecked.value;
        widget.onChange(isChecked.value);
      },
      child: ValueListenableBuilder(
        valueListenable: isChecked,
        builder: (_, value, __) {
          return Row(
            children: [
              if (value)
                CheckBoxFrame.checked(color)
              else
                CheckBoxFrame.unChecked(color),
              if (widget.label != null) Text(widget.label!),
            ],
          );
        },
      ),
    );
  }
}

class CheckBoxFrame extends StatelessWidget {
  final Color icon;
  final Color label;
  final Color frame;
  final Color container;
  final bool showIcon;

  const CheckBoxFrame({
    super.key,
    required this.icon,
    required this.label,
    required this.frame,
    required this.container,
    this.showIcon = false,
  });

  factory CheckBoxFrame.active({
    required QuiColorPalette color,
    required Color frame,
    required Color container,
    required bool showIcon,
  }) {
    return CheckBoxFrame(
      icon: color.grayScale.s100,
      label: color.blackColor.s10,
      frame: frame,
      container: container,
      showIcon: showIcon,
    );
  }

  factory CheckBoxFrame.unChecked(QuiColorPalette color) {
    return CheckBoxFrame.active(
      color: color,
      frame: color.semanticColor.borderMedium,
      container: Colors.transparent,
      showIcon: false,
    );
  }

  factory CheckBoxFrame.checked(QuiColorPalette color) {
    return CheckBoxFrame.active(
      color: color,
      frame: color.blackColor,
      container: color.blackColor,
      showIcon: true,
    );
  }

  factory CheckBoxFrame.disabled(QuiColorPalette color) {
    return CheckBoxFrame(
      icon: color.blackColor.s70,
      label: color.blackColor.s70,
      frame: color.semanticColor.borderLow,
      container: color.blackColor.s100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: container,
        border: Border.all(width: 2, color: frame),
        borderRadius: BorderRadius.circular(4),
      ),
      child: showIcon
          ? CheckedIcons(key: const Key("checked"), icon: icon)
          : const Offstage(),
    );
  }
}


    // if (widget.isDisabled) {
    //   return CheckBoxIconBox(
    //     icon: color.blackColor.s70,
    //     label: color.blackColor.s70,
    //     frame: color.semanticColor.borderLow,
    //     container: color.blackColor.s100,
    //   );
    // }

    // return ValueListenableBuilder(
    //   valueListenable: isChecked,
    //   builder: (_, value, __) {
    //     return CheckBoxIconBox(
    //       icon: color.grayScale.s100,
    //       label: color.blackColor.s10,
    //       frame: value ? color.blackColor : color.semanticColor.borderMedium,
    //       container: value ? color.blackColor : Colors.transparent,
    //       showIcon: value,
    //     );
    //   },
    // );