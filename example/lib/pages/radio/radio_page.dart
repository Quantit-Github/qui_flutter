import 'package:flutter/material.dart';
import 'package:qui_flutter/style/theme.dart';
import 'package:qui_flutter/components/radio/radio_list.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Radio Component",
              style: Theme.of(context).textTheme.headlineLargeBold,
            ),
            QuiRadioList(),
          ],
        ),
      ),
    );
  }
}
