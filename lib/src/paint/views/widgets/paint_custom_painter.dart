import 'package:flutter/material.dart';

class SandboxPainter extends CustomPainter {
  SandboxPainter({
    required this.color,
    required this.points,
  });

  final Color color;
  final List<Offset>? points;

  final List<Path> paths = [];

  @override
  void paint(Canvas canvas, Size size) {
    if (points == null) return;

    List<Offset> pts = points!;

    Path path = Path();
    if (pts.isNotEmpty) {
      path.moveTo(pts[0].dx, pts[0].dy);
      for (final point in pts) {
        path.lineTo(point.dx, point.dy);
      }
    }

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = color
      ..strokeWidth = 5;

    paths.add(path);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SandboxPainter oldDelegate) => false;
}
