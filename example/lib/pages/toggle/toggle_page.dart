import 'package:flutter/material.dart';
import 'package:qui_flutter/core/qui_theme.dart';
import 'package:qui_flutter/style/typography.dart';

class TogglePage extends StatelessWidget {
  const TogglePage({super.key});

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
              "Toggle Component",
              style: QuiTheme.typography(context).headlineLarge.bold,
            ),
            // QuiToggle(
            //   flag: false,
            //   onChanged: (flag) {},
            // ),
            // QuiToggle(
            //   flag: true,
            //   onChanged: (flag) {},
            // ),
            // QuiToggle(
            //   flag: true,
            //   disabled: true,
            //   onChanged: (flag) {},
            // ),
            // QuiToggle(
            //   flag: false,
            //   disabled: true,
            //   onChanged: (flag) {},
            // ),
          ],
        ),
      ),
    );
  }
}
