import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class RadialPainter extends CustomPainter {
  final double progress;
  RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 8
      ..color = Color(0xFF9C27B0)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;
    //canvas.drawCircle(center, size.width / 2, paint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2.5),
        math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
