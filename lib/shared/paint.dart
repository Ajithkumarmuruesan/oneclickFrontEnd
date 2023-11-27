import 'package:flutter/material.dart';

class BorderPainter extends CustomPainter {
  final Color color;
  final double width;

  BorderPainter({required this.color, required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    Rect rect = Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
