import 'package:flutter/material.dart';

class QuarterCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(300, 100), // Size of the canvas
      painter: QuarterCirclePainter(),
    );
  }
}

class QuarterCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue // Change the color as desired
      ..style = PaintingStyle.fill;

    const radius = 100.0; // Adjust the radius as needed
    final center = const Offset(0, 0);

    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius),
        0.5 * 3.14, // Start angle (0.5 * pi)
        0.5 * 3.14, // Sweep angle (0.5 * pi, which is 90 degrees)
        false,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
