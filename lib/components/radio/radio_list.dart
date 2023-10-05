import 'package:flutter/material.dart';
import 'package:qui_flutter/components/radio/radio.dart';

class QuiRadioList extends StatefulWidget {
  @override
  _RadioListState createState() => _RadioListState();
}

class _RadioListState extends State<QuiRadioList> {
  String? _groupValue;

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QuiRadioButton<String>(
            value: 'A',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: 'A',
            text: 'One',
          ),
          QuiRadioButton<String>(
            value: 'B',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: 'B',
            text: 'Two',
          ),
          QuiRadioButton<String>(
            value: 'C',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: 'C',
            text: 'Three',
          ),
          QuiRadioButton<String>(
            value: 'D',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: 'D',
            text: 'Four',
          ),
          QuiRadioButton<String>(
            value: 'E',
            groupValue: _groupValue,
            onChanged: _valueChangedHandler(),
            label: 'E',
            text: 'Five',
          ),
        ],
      ),
    );
  }
}
