import 'package:flutter/material.dart';
import 'package:qui_flutter/core/qui_theme.dart';

enum Hierachy { low, high }

enum Direction { horizontal, vertical }

// class QuiDivider extends StatelessWidget {
//   const QuiDivider(
//       {super.key,
//       required this.direction,
//       required this.hierarachy});

//   final Direction direction;
//   final Hierachy hierarachy;

//   final double _thickness = hierarachy == Hierachy.low ? 1 : 8;

//   @override
//   Widget build(BuildContext context) {
//     if (direction == Direction.vertical) {
//       return VerticalDivider(
//         color: Theme.of(context).colorScheme.background,
//         thickness: _thickness,
//       );
//     }
//     return Divider(
//       color: Theme.of(context).colorScheme.background,
//       height: 1,
//       thickness: _thickness,
//     );
//   }
// }

class QuiDivider extends StatefulWidget {
  const QuiDivider(
      {super.key, required this.hierarachy, required this.direction});

  final Hierachy hierarachy;
  final Direction direction;

  @override
  State<QuiDivider> createState() => _QuiDividerState();
}

class _QuiDividerState extends State<QuiDivider> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _thickness = widget.hierarachy == Hierachy.low ? 1 : 8;
        _color = widget.hierarachy == Hierachy.low
            ? QuiTheme.of(context).colorTokens.dividerTokens.lighten
            : QuiTheme.of(context).colorTokens.dividerTokens.darken;
      });
    });
  }

  late double _thickness = 2;
  Color _color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    switch (widget.direction) {
      case Direction.vertical:
        return VerticalDivider(
          color: _color,
          thickness: _thickness,
        );

      case Direction.horizontal:
        return Divider(
          color: _color,
          height: 1,
          thickness: _thickness,
        );
    }
  }
}
