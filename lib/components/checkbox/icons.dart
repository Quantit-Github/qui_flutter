import 'package:flutter/material.dart';

class CheckedPainter extends CustomPainter {
  final Color icon;
  const CheckedPainter({required this.icon});

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    var paint = Paint()
      ..color = icon
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(17.2559, 5.58926);
    path.cubicTo(17.5814, 5.26382, 17.5814, 4.73619, 17.2559, 4.41075);
    path.cubicTo(16.9305, 4.08531, 16.4028, 4.08531, 16.0774, 4.41075);
    path.lineTo(7.5, 12.9882);
    path.lineTo(3.92259, 9.41075);
    path.cubicTo(3.59715, 9.08531, 3.06951, 9.08531, 2.74408, 9.41075);
    path.cubicTo(2.41864, 9.73619, 2.41864, 10.2638, 2.74408, 10.5893);
    path.lineTo(6.91074, 14.7559);
    path.cubicTo(7.23618, 15.0814, 7.76382, 15.0814, 8.08926, 14.7559);
    path.lineTo(17.2559, 5.58926);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CheckedIcons extends StatelessWidget {
  final Color icon;
  const CheckedIcons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CustomPaint(
        painter: CheckedPainter(icon: icon),
      ),
    );
  }
}
