import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Color(0xffae9aad);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    var startPoint = Offset(size.width/1, size.height / 2);
    var controlPoint1 = Offset(size.width / 6, size.height / 10);
    var controlPoint2 = Offset(3 * size.width / 2, size.height / 8);
    var endPoint = Offset(size.width, size.height / 5);

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