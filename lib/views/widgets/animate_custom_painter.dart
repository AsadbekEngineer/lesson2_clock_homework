import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedCustomPainter extends CustomPainter {
  final DateTime dateTime;

  AnimatedCustomPainter({required this.dateTime});

  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var radius = min(size.width / 2, size.height / 2);

    /// main circle with gradient
    Rect rect = Rect.fromCircle(center: center, radius: radius);
    Paint mainCircleBrush = Paint()
      ..shader = RadialGradient(
        colors: [Color(0xFF333A50), Color(0xFF1C1E2C)],
      ).createShader(rect);

    /// white circle in center
    Paint littleCircleBrush = Paint()..color = Colors.red;

    /// border of clock
    Paint clockBorderBrush = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    /// second of clock
    Paint secondBrush = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4;

    /// minute of clock
    Paint minuteBrush = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    /// hour of clock
    Paint hourBrush = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    /// draw main circle
    canvas.drawCircle(center, radius, mainCircleBrush);

    /// draw clock border
    canvas.drawCircle(center, radius, clockBorderBrush);

    /// draw hour hand
    var hourHandX = center.dx +
        radius *
            0.5 *
            cos((dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180);
    var hourHandY = center.dy +
        radius *
            0.5 *
            sin((dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourBrush);

    /// draw minute hand
    var minuteHandX =
        center.dx + radius * 0.7 * cos(dateTime.minute * 6 * pi / 180);
    var minuteHandY =
        center.dy + radius * 0.7 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), minuteBrush);

    /// draw second hand
    var secondHandX =
        center.dx + radius * 0.9 * cos(dateTime.second * 6 * pi / 180);
    var secondHandY =
        center.dy + radius * 0.9 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondBrush);

    /// draw center dot
    canvas.drawCircle(center, 8, littleCircleBrush);

    /// draw dashes for each hour
    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 30) {
      var x1 = center.dx + outerCircleRadius * cos(i * pi / 180);
      var y1 = center.dy + outerCircleRadius * sin(i * pi / 180);

      var x2 = center.dx + innerCircleRadius * cos(i * pi / 180);
      var y2 = center.dy + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
