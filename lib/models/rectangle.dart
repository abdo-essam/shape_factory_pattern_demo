import 'package:flutter/material.dart';
import 'shape.dart';

class Rectangle implements Shape {
  @override
  String revealMe() => "You chose to print rectangle";

  @override
  Color get color => Colors.green;

  @override
  IconData get icon => Icons.rectangle_outlined;

  @override
  String get name => 'Rectangle';

  @override
  Widget buildShapeWidget() {
    return CustomPaint(
      size: const Size(150, 100),
      painter: RectanglePainter(color: color),
    );
  }
}

class RectanglePainter extends CustomPainter {
  final Color color;

  RectanglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(8));

    canvas.drawRRect(rrect, paint);
    canvas.drawRRect(rrect, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}