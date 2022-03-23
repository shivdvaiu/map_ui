import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class CurvePainterTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

      paint.color = Color(0xffae9aad);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3;

    var startPoint = Offset(0, size.height / 2);
    var controlPoint1 = Offset(size.width / 7, size.height / 7);
    var controlPoint2 = Offset(2 * size.width / 7, size.height / 3);
    var endPoint = Offset(size.width, size.height / 2);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    canvas.drawPath(
      dashPath(
        path,
        dashArray: CircularIntervalList<double>(<double>[10.0, 10]),
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}