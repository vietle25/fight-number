import 'package:fight_number/utils/utils.dart';
import 'package:flutter/material.dart';

class QuarterCircleBottomRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(Utils.getWidth(), 100), // Size of the canvas
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
    var center = Offset(size.width, size.height);

    final path = Path()
      ..moveTo(center.dx, center.dy)
      ..arcTo(
        Rect.fromCircle(center: center, radius: radius),
        1 * 3.14, // Start angle (0.5 * pi)
        1 * 3.14, // Sweep angle (0.5 * pi, which is 90 degrees)
        false,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
