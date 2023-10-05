import 'package:flutter/material.dart';
import 'package:qui_flutter/components/divider/divider.dart';
import 'package:qui_flutter/style/theme.dart';

class DividerPage extends StatelessWidget {
  const DividerPage({super.key});

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
              "Divider Component",
              style: Theme.of(context).textTheme.headlineLargeBold,
            ),
            const QuiDivider(
              hierarachy: Hierachy.low,
              direction: Direction.horizontal,
            ),
            const QuiDivider(
              hierarachy: Hierachy.high,
              direction: Direction.horizontal,
            ),
            const QuiDivider(
              hierarachy: Hierachy.low,
              direction: Direction.vertical,
            ),
          ],
        ),
      ),
    );
  }
}
