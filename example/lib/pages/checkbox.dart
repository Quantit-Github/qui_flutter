import 'package:flutter/material.dart';
import 'package:example/pages/base.dart';
import 'package:qui_flutter/qui_flutter.dart';

class CheckBoxPage extends BasePage {
  const CheckBoxPage({super.key});

  @override
  List<Widget> get children => [
        CheckBox(
          initial: true,
          isDisabled: false,
          useIndeterminateState: false,
          onChange: (value) {},
          label: "Checkbox",
        ),
      ];

  @override
  String get title => "CheckBox Components";
}
