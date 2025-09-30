import 'package:flutter/material.dart';

class CloudPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  CloudPainter({required this.color, this.strokeWidth = 0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.2, size.height * 0.75)

      // left puff
      ..quadraticBezierTo(
          size.width * 0.1, size.height * 0.55, size.width * 0.3, size.height * 0.5)

      // top-left puff
      ..quadraticBezierTo(
          size.width * 0.35, size.height * 0.25, size.width * 0.55, size.height * 0.35)

      // top-right puff
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.2, size.width * 0.8, size.height * 0.45)

      // right puff
      ..quadraticBezierTo(
          size.width * 0.95, size.height * 0.55, size.width * 0.75, size.height * 0.75)

      // bottom puff
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.85, size.width * 0.2, size.height * 0.75)

      ..close();

    canvas.drawPath(path, paint);

    // add some extra small arcs for fluffiness
    final fluffPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width * 0.35, size.height * 0.55), size.width * 0.12, fluffPaint);
    canvas.drawCircle(
        Offset(size.width * 0.55, size.height * 0.55), size.width * 0.15, fluffPaint);
    canvas.drawCircle(
        Offset(size.width * 0.7, size.height * 0.6), size.width * 0.1, fluffPaint);

    // optional stroke
    if (strokeWidth > 0) {
      final strokePaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;
      canvas.drawPath(path, strokePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
