import 'package:flutter/material.dart';
import 'shape.dart';

class Circle implements Shape {
  @override
  String revealMe() => "You chose to print circle";

  @override
  Color get color => Colors.blue;

  @override
  IconData get icon => Icons.circle_outlined;

  @override
  String get name => 'Circle';

  @override
  Widget buildShapeWidget() {
    return CustomPaint(
      size: const Size(100, 100),
      painter: CirclePainter(color: color),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Color color;

  CirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}