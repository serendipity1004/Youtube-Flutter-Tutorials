import 'dart:math';

import 'package:flutter/material.dart';

class WatchPainter extends CustomPainter {
  final TextPainter tp;
  final Color primaryColor;
  final DateTime now;

  WatchPainter(
    DateTime now,
  )   : this.tp = TextPainter(
          textDirection: TextDirection.ltr,
        ),
        this.primaryColor = Color(0xFFE57242),
        this.now = now;

  @override
  void paint(Canvas canvas, Size size) {
    final xCenter = size.width / 2;
    final yCenter = size.height / 2;

    final angle = (2 * pi) / 12;

    canvas.save();

    canvas.translate(xCenter, yCenter);

    renderText(canvas, size, xCenter, yCenter, angle);
    renderHands(canvas, size, xCenter, yCenter);

    canvas.restore();
  }

  renderHands(Canvas canvas, Size size, double xCenter, yCenter) {
    canvas.save();

    final innerPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    final outerPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    final secPaint = Paint()
      ..color = primaryColor
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.square;

    final rootPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.square;

    final rootWhiteCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final rootPrimaryCirclePaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.fill;

    final rootBlackCirclePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    final rootOffset = 14.0;

    final hourAngle =
        (now.hour % 12) * (2 * pi / 12) + (now.minute) * (2 * pi / (12 * 60));
    final minuteAngle = now.minute * (2 * pi / 60);
    final secondAngle = now.second * (2 * pi / 60);

    // 시침
    canvas.save();

    canvas.rotate(hourAngle);
    canvas.drawLine(Offset.zero, Offset(0.0, -rootOffset), rootPaint);
    canvas.drawLine(
        Offset(0.0, -rootOffset), Offset(0.0, -xCenter * 0.7), outerPaint);
    canvas.drawLine(
        Offset(0.0, -rootOffset), Offset(0.0, -xCenter * 0.7), innerPaint);

    canvas.restore();

    // 분침
    canvas.save();

    canvas.rotate(minuteAngle);
    canvas.drawLine(Offset.zero, Offset(0.0, -rootOffset), rootPaint);
    canvas.drawLine(
        Offset(0.0, -rootOffset), Offset(0.0, -xCenter * 0.9), outerPaint);
    canvas.drawLine(
        Offset(0.0, -rootOffset), Offset(0.0, -xCenter * 0.9), innerPaint);
    canvas.restore();

    // 시침
    canvas.save();

    canvas.rotate(secondAngle);
    canvas.drawLine(Offset(0.0, 10.0), Offset(0.0, -xCenter * 0.9), secPaint);
    canvas.drawCircle(Offset.zero, 6.0, rootWhiteCirclePaint);
    canvas.drawCircle(Offset.zero, 4.0, rootPrimaryCirclePaint);
    canvas.drawCircle(Offset.zero, 2.0, rootBlackCirclePaint);

    canvas.restore();

    canvas.restore();
  }

  renderText(
      Canvas canvas, Size size, double xCenter, double yCenter, double angle) {
    canvas.save();

    final vertLength = yCenter / cos(angle);
    final horiLength = xCenter / sin(angle * 2);

    final lengthList = [
      yCenter,
      vertLength,
      horiLength,
      xCenter,
      horiLength,
      vertLength,
      yCenter,
    ];

    for (int i = 0; i < 12; i++) {
      canvas.save();

      canvas.translate(0.0, -lengthList[i % 6]);

      final display = i == 0 ? '12' : i.toString();

      tp.text = TextSpan(
        text: display,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      );

      canvas.rotate(-angle * i);

      tp.layout();
      tp.paint(
        canvas,
        Offset(
          -(tp.width / 2),
          -(tp.height / 2),
        ),
      );

      canvas.restore();

      canvas.rotate(angle);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
