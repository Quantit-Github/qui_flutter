import 'package:example/components/toggle_theme.dart';
import 'package:flutter/material.dart';
import 'package:qui_flutter/core/qui_theme.dart';
import 'package:qui_flutter/style/color.dart';
import 'package:qui_flutter/style/typography.dart';

abstract class BasePage extends StatelessWidget {
  const BasePage({super.key});
  String get title;
  List<Widget> get children;

  @override
  Widget build(BuildContext context) {
    QuiColorPalette color = QuiTheme.of(context).color;
    QuiTypography typography = QuiTheme.typography(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: typography.headlineSmall.bold),
        backgroundColor: color.primary.s90,
        scrolledUnderElevation: 1,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
      floatingActionButton: const ToggleTheme(),
    );
  }
}
